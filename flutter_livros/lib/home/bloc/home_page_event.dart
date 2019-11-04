import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

//terá os eventos para a pagina inicial: pesquisa de livros pelos filtros

class HomePageEvent extends Equatable{
  HomePageEvent([List tmp = const []]):super(tmp);
}

//passa o filtro escolhido pelo usuário
class HomePageEventSearch extends HomePageEvent{
  final String query;
  HomePageEventSearch({
    @required this.query
  });

  @override
  String toString()=> "HomePageEventSearch";
}