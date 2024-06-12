import 'package:flutter/material.dart';
import 'package:aris_news/models/post_functionality.dart';

import '../models/post.dart';
import '../views/single_post_screen.dart';

class AllNewsViewModel extends ChangeNotifier {
  List allPostsList = [];
  List footballPostsList = [];
  List basketballPostsList = [];
  var postFunctionalityObj = PostFunctionality();
  late final Post postObj;

  void onPostClicked(BuildContext context, int index) {
    if (index >= 0 && index < allPostsList.length) {
      var postObjNow = allPostsList[index];
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SinglePostScreen(postObj: postObjNow)),
      );
    }
  }

  void change(){
    notifyListeners();
  }

  Future<void> loadAllPostsApi() async {

    try {
      Map responseApiData = await postFunctionalityObj.loadAllPostsApi();

      if (responseApiData['error']) {
        // Handle error
      }
      else{
        allPostsList = responseApiData['allPostsList'];
        footballPostsList = responseApiData['footballPostsList'];
        basketballPostsList = responseApiData['basketballPostsList'];
        // Notify listeners that the data has changed
        notifyListeners();
      }
    } catch (e) {
      // Handle exceptions
      // ...
    } finally {
      // Perform any cleanup or finalize the loading process
      // ...
    }
  }
}
