import 'package:aris_news/views/splash_screen.dart';
import 'package:aris_news/view_models/all_news_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import 'views/all_news_screen.dart';
import 'views/basketball_screen.dart';
import 'views/football_screen.dart';


class AppSplashScreen extends StatelessWidget {
  const AppSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen Aris News',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Aris News',
      builder: EasyLoading.init(),
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'All Aris team news'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;
  final _allNewsSreenViewModel = AllNewsViewModel();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget loadingContainer(){
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black))),
    );
  }

  Widget _displaySelectedScreen(screen) {
    switch (screen) {
      case 0:
        return _allNewsSreenViewModel.footballPostsList.length > 0
            ? FootballScreen(viewModel: _allNewsSreenViewModel)
            : loadingContainer();
      case 1:
        return _allNewsSreenViewModel.allPostsList.length > 0
            ? AllNewsScreen(viewModel: _allNewsSreenViewModel)
            : loadingContainer();
      case 2:
        return _allNewsSreenViewModel.basketballPostsList.length > 0
            ? BasketballScreen(viewModel: _allNewsSreenViewModel)
            : loadingContainer();
      default:
        return _allNewsSreenViewModel.allPostsList.length > 0
            ? AllNewsScreen(viewModel: _allNewsSreenViewModel)
            : loadingContainer();
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AllNewsViewModel>(context);

    return FutureBuilder(
      //IF I WANT TO ALWAYS SEARCH FOR NEW POSTS LIKE FIREBASE,
      //future: provider.loadAllPostsApi(),
      future: _allNewsSreenViewModel.loadAllPostsApi(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 50,
            backgroundColor: HexColor("#ffbf00"),
            title: Row(
              children: [
                Image.asset(
                  'assets/aris-news-logo.png',
                  height: 35,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
          body: RefreshIndicator(
            onRefresh: () async {
               provider.loadAllPostsApi();
            },
            child: _displaySelectedScreen(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.sports_soccer),
                label: 'Ποδόσφαιρο',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Αρχική',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports_basketball),
                label: 'Basket',
              ),
            ],
            unselectedLabelStyle: TextStyle(fontSize: 10),
            selectedLabelStyle: TextStyle(fontSize: 12),
            unselectedItemColor: HexColor("#ffbf00").withOpacity(0.5),
            currentIndex: _selectedIndex,
            selectedItemColor: HexColor("#ffbf00"),
            onTap: _onItemTapped,
          ),
        );
      },
    );
  }
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AllNewsViewModel()),
      ],
      child: const AppSplashScreen(),
    ),
  );
}
