import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_livros/home/bloc/home_page_event.dart';
import 'package:flutter_livros/home/bloc/home_page_state.dart';
import 'package:flutter_livros/home/bloc/home_page_bloc.dart';
import 'package:flutter_livros/widgets/book_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

import '../repository.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomePageBloc bloc;

  List<String> categorias = [
    "Android", "Java", "História", "Ciências", "Myths", "Typograpy"
  ];

  int _selectedIndex =0;

  _onCategorySelected(int index) {
    //qdo uma categoria for selecionada, o indice é atualizado
    setState(() {
      _selectedIndex = index;
    });

    //dispara um evento
    final category = categorias[index];
    bloc.dispatch(HomePageEventSearch(
      query: category
    ));
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);//deixa a tela em fullscreen

    bloc = HomePageBloc(
        repository: Repository()
    );

    //sempre q inicializar a pagina vai pegar essa categoria de livro
    bloc.dispatch(HomePageEventSearch(
      query: categorias[0]
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Padding(
            padding: const EdgeInsets.only(top: 42, left: 24),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 32,
                      ),
                      child: Text("Browse",
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text("Recommended",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[400],
                      ),
                    )
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,//se comporta com a mesma largura da tela
                  height: 80,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: categorias.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext c, int index){
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 6, right: 6,
                        ),
                        child: GestureDetector(
                          onTap: ()=> _onCategorySelected(index),
                          child: Chip(
                            padding: EdgeInsets.only(
                              left: 8, right: 8,
                            ),
                            backgroundColor: index == _selectedIndex ? Colors.blue : Colors.grey[200], //qdo clicar muda pra azul
                            label: Text(categorias.elementAt(index),
                              style: TextStyle(
                                color: index == _selectedIndex ? Colors.white : Colors.grey[500],//mudar a letra
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                BlocBuilder<HomePageBloc,HomePageState>( //só irá reconstruir a parte q tem a lista
                  bloc: bloc,
                  builder: (context, state){
                    if(state is HomePageStateLoading)
                      return Center(child: CircularProgressIndicator(),);
                    if(state is HomePageStateError)
                      return Center(child: Text(state.message));
                    if(state is HomePageStateLoadingSuccess){
                      final books = state.books;
                      return  Expanded(
                        child: Container(
                          child: ListView.builder(
                            itemCount: books.length,
                            itemBuilder: (context, index){
                              final item = books.elementAt(index);
                              return BookWidget(book: item);
                            },
                          ),
                        ),
                      );
                    }
                    return SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
    );
  }

}
