import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true,
        leading: IconButton(//uma das posições, canto superior esquerdo
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: ()=>Navigator.pop(context,false),
        ),
      ),
      body: Container(

      ),
    );
  }
}
