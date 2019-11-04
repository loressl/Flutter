import 'package:equatable/equatable.dart';
import 'package:flutter_livros/models.dart';
import 'package:meta/meta.dart';

class HomePageState extends Equatable{
  HomePageState([List tmp = const []]): super(tmp);
}

//estado será enviado para UI pela primeira vez qdo for aberta
//não terá nenhuma informação a passar
class HomePageStateLoading extends HomePageState{
  @override
  String toString() => "HomePageStateLoading";
}

//será usado qdo conseguir obter os dados com sucesso da api
//tem que enviar a lista de livros obtidas do servidor
class HomePageStateLoadingSuccess extends HomePageState{
  final List<Book> books;

  HomePageStateLoadingSuccess({ @required this.books});

  @override
  String toString() => "HomePageStateSuccess";
}

//quando não consegue obter os dados da api por erro na net ou outro
class HomePageStateError extends HomePageState{
  final String message;

  HomePageStateError({@required this.message});

  @override
  String toString() => "HomePageStateError";
}