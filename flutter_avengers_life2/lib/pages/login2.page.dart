import 'package:flutter/material.dart';
import 'package:flutter_avengers_life2/pages/reset.password.page.dart';
import 'package:flutter_avengers_life2/pages/signup.page.dart';
import 'package:flutter_avengers_life2/widgets/formcard.dart';

class LoginPage2 extends StatefulWidget {
  @override
  _LoginPage2State createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  bool _isSelected = false;

  void _radio(){
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  Widget radioButton(bool isSelected) => Container(
      width: 16.0,
      height: 16.0,
      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2.0, color: Colors.white)
      ),
      child: isSelected ? Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white
        ),
      ) : Container()
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Image.asset("assets/24809.jpg"),
              ),
              FormCard(),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 12.0,
                      ),
                      GestureDetector(
                          onTap: _radio,
                          child: radioButton(_isSelected),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}


