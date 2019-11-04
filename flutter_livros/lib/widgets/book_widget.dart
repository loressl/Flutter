import 'package:flutter/material.dart';

import '../models.dart';

class BookWidget extends StatelessWidget {
  final Book book;
  VolumeInfo get bookInfo => book.volumeInfo;

  BookWidget({
    Key key,
    @required this.book
  }) : assert(book!=null),
        super(key: key);

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
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(width: 0.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(bookInfo.imageLinks.smallThumbnail)
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 200,
              height: 200,
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
                  Text(bookInfo.title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),),
                  Text(bookInfo.authors[0],
                    overflow: TextOverflow.ellipsis,
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
