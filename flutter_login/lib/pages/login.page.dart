import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: EdgeInsets.all(10),
        child:  Center(
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, //largura da coluna irá tomar a pagina. Tomar cuidado qdo for responsivo
            mainAxisAlignment: MainAxisAlignment.center, //faz a centralização no meio da pagina
            //aqui vai estrutura os campos dos logins
            children: <Widget>[
              TextFormField( //desenha o input
                autofocus: true,
                keyboardType: TextInputType.text,
                style: new TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                  labelText: "username",
                  labelStyle: TextStyle(color: Colors.white)),
                ),
              Divider(),
              TextFormField( //desenha o input
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.text,
                style: new TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                    labelText: "password",
                    labelStyle: TextStyle(color: Colors.white)),
              ),
              Divider(),
              ButtonTheme(
                height: 60.0,
                child: RaisedButton(
                  onPressed: ()=>{},
                  child: Text(
                    "Sign in",
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
