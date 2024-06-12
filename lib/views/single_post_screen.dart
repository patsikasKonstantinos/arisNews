import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../models/post.dart';
import 'package:flutter_html/flutter_html.dart';

class SinglePostScreen extends StatefulWidget {
  const SinglePostScreen({Key? key, required this.postObj }) : super(key: key);
  final Post postObj;

  @override
  State<SinglePostScreen> createState() => _SinglePostScreenState();
}

class _SinglePostScreenState extends State<SinglePostScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        toolbarHeight: 50,
        backgroundColor:   HexColor("#ffbf00"),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
          children: [

            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back,size: 27,),
            ),

            Spacer(),

            Image.asset('assets/aris-news-logo.png',
              height: 35,
              fit: BoxFit.contain,
            ),

            Spacer()
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              decoration: BoxDecoration(color: Colors.black),
              constraints: BoxConstraints(maxHeight: 350),
              child: CachedNetworkImage(
                imageUrl: widget.postObj.imgUrl,
                fit: BoxFit.fitHeight,
                width: double.infinity,
                alignment: Alignment.topCenter,
                placeholder: (context, url) =>
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Center(
                          child: Container(
                            height: 20,
                            width: 20,
                            margin: EdgeInsets.all(5),
                            child: CircularProgressIndicator(
                              strokeWidth: 2.0,
                              valueColor : AlwaysStoppedAnimation(Colors.white),
                            ),
                          ),
                        ),

                      ],
                    ), 
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),

            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 15,left: 15,right: 15),
              child: Text(widget.postObj.title,
                style: TextStyle(
                  color:  HexColor("#ffbf00"),
                  fontSize: 19,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),

            if(!widget.postObj.date.isEmpty)...[
              Row(
                children: [

                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 0,left: 15,right: 0),
                    child: Icon(Icons.calendar_today,
                      size: 12,
                      color:  HexColor("#ffbf00"),
                    ),
                  ),

                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 0,left: 10,right: 15),
                    child: Text(widget.postObj.date,
                      style: TextStyle(
                        color:  HexColor("#ffbf00"),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              )
            ],

            Container(
              padding: EdgeInsets.only(left: 5,right: 5,top: 15,bottom: 15),
              child: Html(
                data: widget.postObj.fullText,
              ),
            )
          ],
        ),
      ),
    );
  }
}
