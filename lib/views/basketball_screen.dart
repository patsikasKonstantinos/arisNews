import 'package:aris_news/views/single_post_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../view_models/all_news_view_model.dart';

class BasketballScreen extends StatefulWidget {
  const BasketballScreen( {Key? key,required this.viewModel }) : super(key: key);
  final AllNewsViewModel viewModel;

  @override
  State<BasketballScreen> createState() => _BasketballScreenState();
}

class _BasketballScreenState extends State<BasketballScreen> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          //Main Image
          for(var count_banners=0;count_banners<30;count_banners++)...[
            if(widget.viewModel.basketballPostsList.asMap().containsKey(count_banners))...[
              GestureDetector(
                onTap: (){
                  var postObjNow= widget.viewModel.basketballPostsList[count_banners];
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        SinglePostScreen(postObj:postObjNow)),
                  );
                },
                child: Container(
                  height: 100,
                  margin : EdgeInsets.only(left: 15,right: 15,
                      top: count_banners==0?15:7.5,bottom: count_banners==4?15:7.5),
                  decoration: BoxDecoration(
                      color: Colors.white
                  ),
                  child: Row(
                    children: [

                      Container(
                        child: Center(
                          child: CachedNetworkImage(
                            imageUrl: widget.viewModel.basketballPostsList[count_banners].imgUrl,
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
                          padding: EdgeInsets.only(left: 10,top: 10,right: 10 ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[

                              Text(widget.viewModel.basketballPostsList[count_banners].title,
                                style: TextStyle(
                                    fontWeight:FontWeight.bold
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),

                              Expanded(
                                child: Text(widget.viewModel.basketballPostsList[count_banners].text,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
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
    );
  }
}
