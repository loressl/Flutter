import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_books_bloc_http/home_page/book_widget.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categorias = [
    "Android", "Java", "História", "Ciências", "Myths", "Typograpy"
  ];

  int _selectedIndex =0;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Padding(
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
                        onTap: (){//qdo clicar na lista de cima
                          _selectedIndex = index;
                          setState(() {});
                        },
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
              ListView.builder(
                itemCount: categorias.length,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return BookWidget();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
