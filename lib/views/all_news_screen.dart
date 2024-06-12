import 'package:aris_news/models/post.dart';
import 'package:aris_news/views/single_post_screen.dart';
import 'package:aris_news/view_models/all_news_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AllNewsScreen extends StatefulWidget {

  const AllNewsScreen({Key? key, required this.viewModel }) : super(key: key);
  final AllNewsViewModel viewModel;

  @override
  State<AllNewsScreen> createState() => _AllNewsScreenState();
}

class _AllNewsScreenState extends State<AllNewsScreen> {

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          //Main Image
          GestureDetector(
            onTap: (){
              widget.viewModel.onPostClicked(context, 0);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black12
              ),
              child: Stack(
                children: [

                  ConstrainedBox(
                    child: Container(
                      decoration: BoxDecoration(color: Colors.black),
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        height: 350,
                        child: CachedNetworkImage(
                          imageUrl: widget.viewModel.allPostsList[0].imgUrl,
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
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.only(left: 10,right: 10,bottom: 15,top: 10),
                      width:  MediaQuery.of(context).size.width ,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7)
                      ),
                      child: Text('${widget.viewModel.allPostsList[0].title}',
                        style: TextStyle(
                            fontWeight:FontWeight.bold,
                            fontSize: 19,
                            color:  HexColor("#ffbf00")
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                for(var rows=1;rows<=3;rows++)...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        for(var columns=1;columns<=2;columns++)...[
                          GestureDetector(
                            onTap: (){
                               widget.viewModel.onPostClicked(context, (rows - 1) * 2 + columns);
                            },
                            child: Container(
                              width:  MediaQuery.of(context).size.width*0.5,
                              height: 150 ,
                              padding : EdgeInsets.only(left:columns==1?7.5:0,
                                  right: columns==2?7.5:7.5,top: rows==1?7.5:7.5 ) ,
                              child: Stack(
                                children: [

                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black
                                    ),
                                    child: Center(
                                      child: CachedNetworkImage(
                                        imageUrl: widget.viewModel.allPostsList[(rows - 1) * 2 + columns].imgUrl,
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topCenter,
                                        height: 150,
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
                                  ),

                                  Positioned(
                                    bottom: 0,
                                    child: Container(
                                      padding: EdgeInsets.only(left: 15,right: 15,bottom: 10),
                                      height: 150,
                                      width: (MediaQuery.of(context).size.width*0.5),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.4)
                                      ),
                                      child: Column(
                                        children: [

                                          Spacer(),

                                          Text(widget.viewModel.allPostsList[(rows - 1) * 2 + columns].title,
                                            style: TextStyle(
                                                fontWeight:FontWeight.bold,
                                                color:  HexColor("#ffbf00")
                                            ),
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ]
                      ],
                    )
                 ],

                 for(var count_banners=7;count_banners<30;count_banners++)...[

                  if(widget.viewModel.allPostsList.asMap().containsKey(count_banners))...[
                    GestureDetector(
                      onTap: (){
                        widget.viewModel.onPostClicked(context,count_banners);
                      },
                      child: Container(
                        height: 100,
                        margin : EdgeInsets.only(left: 15,right: 15,
                            top: count_banners==7?15:7.5,bottom: count_banners==30?15:7.5),
                        decoration: BoxDecoration(
                            color: Colors.white
                        ),
                        child: Row(
                          children: [

                            Container(
                              child: Center(
                                child: CachedNetworkImage(
                                  imageUrl: widget.viewModel.allPostsList[count_banners].imgUrl,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                  width: 100,
                                  height: 100,
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
                            ),

                            Expanded(
                              child:Container(
                                height: 100,
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.only(left: 10,top: 10,right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:[

                                    Text(widget.viewModel.allPostsList[count_banners].title,
                                      style: TextStyle(
                                          fontWeight:FontWeight.bold
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),

                                    Expanded(
                                      child: Text(widget.viewModel.allPostsList[count_banners].text,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    )
                                  ]
                                )
                              )
                            )
                          ],
                        ),
                      ),
                    )
                  ]
                ]
              ],
            ),
          )
        ],
      ),
    );
  }
}
