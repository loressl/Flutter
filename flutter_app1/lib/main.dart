import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app1/models/item.dart';
//roda uma função q passa um widget
void main() => runApp(MyApp());
//widget n tem estado, só precisa de elementos visuais, n faz nada
//build constroi o layout
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //sempre retornar um materialapp
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        //swatch = palheta
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

//só será chamada 1 vez
class HomePage extends StatefulWidget {
  var items = new List<Item>();

  HomePage(){
    items = [];
//    items.add(Item(title: "Banana", done: false));
//    items.add(Item(title: "Abacate", done: true));
//    items.add(Item(title: "Laranja", done: false));
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var newTasckCtrl = TextEditingController();

  _HomePageState(){
    load();
  }

  void add(){
    if(newTasckCtrl.text.isEmpty) return;

    setState(() {
      widget.items.add(
          Item(
              title: newTasckCtrl.text,
              done: false,
          )
      );
      newTasckCtrl.text="";
      save();
    });
  }

  void remove(int index){
    setState(() {
      widget.items.removeAt(index);
      save();
    });
  }

  //função para ler o shared preferences
  //tem q ser assincrona, é como se ficasse na fila para retornar depois
  Future load() async{
    var prefs = await SharedPreferences.getInstance(); //await aguarde
    var data = prefs.getString('data');

    if(data != null){
      Iterable decoded = jsonDecode(data);//decodificar
      List<Item> result = decoded.map((x) => Item.fromJson(x)).toList();//map percorre os itens, tipo for each
      setState(() {
        widget.items = result;
      });
    }
  }

  save() async{
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', jsonEncode(widget.items));//transforma em json
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: Text("Oi"), tipo o botão q coloca do lado
        title: TextFormField(
          controller: newTasckCtrl,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            labelText: "Nova Tarefa",
            labelStyle: TextStyle(
                color: Colors.white,
            ),
          ),
        ), //cria uma caixa de texto
//        actions: <Widget>[
//          Icon(Icons.plus_one),
//        ], tipo os botões do menu bar
      ),
      body: ListView.builder( //constroi dinamicamente baseada no tamanho
        itemCount: widget.items.length, //acessa os itens da homepage
        itemBuilder: (BuildContext context, int index){//como desenhar os itens na tela
          final item = widget.items[index];
          //return Text(item.title);
          return Dismissible(
            child: CheckboxListTile(
              title: Text(item.title),
              value: item.done,
              onChanged: (value){
                setState(() { //no stateful, pois muda
                  item.done = value;
                  save();
                });
              },
            ),
            key: Key(item.title),
            background: Container(
              color: Colors.red.withOpacity(0.2),//coloca a cor ao arrastar e a opacidade
            ),
            onDismissed: (direction){
              remove(index);
            },
          ); //permite arrastar o item
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: add,
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }
}



