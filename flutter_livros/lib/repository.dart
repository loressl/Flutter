import 'package:flutter_livros/home/bloc/home_page_state.dart';
import 'package:flutter_livros/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as converter;

class Repository{

  final String BaseUrl = "https://www.googleapis.com/books/v1/volumes";

  //retorna a lista que vem da api com base na query
  Future<HomePageState> getBooks(String query) async{
    String query1 = query.toLowerCase();
    try{
      final url= "$BaseUrl?q=$query1"; //concatena
      var response = await http.get(url);

      if(response.statusCode == 200){
        var body = response.body;
        var json = converter.jsonDecode(body);//converte o body em um map
        var data = BooksApiModel.fromJson(json);

        var books = data.items;

        return HomePageStateLoadingSuccess(
            books: books
        );
      }else{
        return HomePageStateError(
            message:"Falha na conexão!!"
        );
      }
    }catch(e){
      print(e);
      return HomePageStateError(
          message:"Erro desconhecido!!"
      );
    }

  }
}