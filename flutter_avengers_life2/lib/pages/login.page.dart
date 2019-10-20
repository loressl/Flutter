
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 40, left: 40, right: 40),
        color: Colors.amber[50],
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 130,
              height: 128,
              child: Image.asset("assets/avengers-logo-png-avengers1-png-2943.png"),
            ),
            SizedBox(//espaçamento entre a imagem e o próximo campo
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Username",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400, //quase negrito
                  fontSize: 20,
                )
              ),
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400, //quase negrito
                    fontSize: 20,
                  )
              ),
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text(
                  "Recover Password",
                  textAlign: TextAlign.right,
                ),
                onPressed: (){},
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  stops: [0.3, 1],
                  colors: [
                    Color(0xFFFFE082),
                    Color(0xFFFFC107),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, //coloca um espaço entre os itens
                    children: <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Image.asset("assets/avengers-symbol-png-16.png"),
                          height: 33,
                          width: 33,
                        ),
                      ),
                    ],
                  ),
                  onPressed: (){

                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                   color: Color(0xFF3C5A99),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, //coloca um espaço entre os itens
                    children: <Widget>[
                      Text(
                        "Login with Facebook",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Image.asset("assets/fb-icon.png"),
                          height: 28,
                          width: 28,
                        ),
                      ),
                    ],
                  ),
                  onPressed: (){

                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              child: FlatButton(
                child: Text(
                  "Register",
                  textAlign: TextAlign.center,
                ),
                onPressed: (){},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
