
import 'package:aris_news/models/post.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
class PostFunctionality {
  Map responseData={};

  Future<Map> loadAllPostsApi() async{

    List allPostsList=[];
    List footballPostsList=[];
    List basketballPostsList=[];
    Post postObj;
    var apiError=false;
    var data = {};
    var body = convert.jsonEncode(data);
    var url=Uri.parse('YOUR_API_URL_HERE');

    try {
      var response = await http.post(url, body: body);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
        allPostsList=[];
        footballPostsList=[];
        basketballPostsList=[];
        for(var i=0;i<jsonResponse['posts'].length;i++){

          var id=jsonResponse['posts'][i]['id'];
          var category=jsonResponse['posts'][i]['category'];
          var title=jsonResponse['posts'][i]['title'];
          var text=jsonResponse['posts'][i]['text'];
          var fullText=jsonResponse['posts'][i]['fullText'];
          var imgUrl=jsonResponse['posts'][i]['main_photo_url'];
          var date=jsonResponse['posts'][i]['date'];
          if(date == null){
            date='';
          }
          postObj = Post(id, category, title, text,fullText,imgUrl,date);
          allPostsList.add(postObj);

          if(category==2){
            footballPostsList.add(postObj);
          }

          if(category==3) {
            basketballPostsList.add(postObj);
          }
        }
      }
      else{
        apiError=true;
      }
    }
    catch(error){
      apiError=true;
    }

    responseData={
      "error":apiError,
      "allPostsList":allPostsList,
      "footballPostsList":footballPostsList,
      "basketballPostsList": basketballPostsList
    };

    return responseData;
  }
}

