import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_livros/home/bloc/home_page_event.dart';
import 'package:flutter_livros/home/bloc/home_page_state.dart';
import 'package:flutter_livros/repository.dart';

//bloc é um componente de regra de negocio
//passa o evento e o estado e o bloc retornará todos os estados
//trata e retorna um estado da pagina inicial
class HomePageBloc extends Bloc<HomePageEvent,HomePageState>{

  final Repository repository;

  HomePageBloc({@required this.repository});

  @override
  HomePageState get initialState => HomePageStateLoading();//primeiro estado a ser apresentado qdo a apalicação iniciar

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {//mapear os eventos q entra para o estado
    if(event is HomePageEventSearch){
      yield HomePageStateLoading();//vai mostrar algo para ver q está carregando

      var query = event.query;//pega a escolha do usuario
      var booksResult = await repository.getBooks(query);//vai no respositorio e faz a requisição
      yield booksResult;
    }
  }

}