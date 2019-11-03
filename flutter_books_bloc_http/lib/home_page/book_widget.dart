import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
  String imageUrl = "https://images.unsplash.com/photo-1535498730771-e735b998cd64?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 230,
      margin: EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: Stack(//serve para sobrepor outros widgets
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              child: Image.network(imageUrl,
                fit: BoxFit.fill,
                width: 200,
              ),
            ),
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 200,
              height: 180,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(16)
                ),
                boxShadow: [//sombra
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15,
                  )
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("Book title",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),),
                  Text("book autor",
                    style: TextStyle(
                      color: Colors.grey
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child:Icon(Icons.arrow_forward_ios, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
