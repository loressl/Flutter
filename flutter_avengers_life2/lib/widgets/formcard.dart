import 'package:flutter/material.dart';

class FormCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      width: double.infinity,
      height: 225,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0
            ),
            BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0
            ),
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Login", style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontFamily: "Poppins-Bold",
                letterSpacing: .5
            )),
            SizedBox(
              height: 10,
            ),
            Text("Username",style: TextStyle(
                color: Colors.black,
                fontFamily: "Poppins-Medium",
                fontSize: 18
            )),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Username",
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text("Password",style: TextStyle(
                color: Colors.black,
                fontFamily: "Poppins-Medium",
                fontSize: 18
            )),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Colors.blue,
                    fontFamily: "Poppins-Medium",
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
