import 'package:flutter/material.dart';
import 'categories/home.dart';
import 'package:image_picker/image_picker.dart';
import 'imageSearch/camera_result.dart';
import 'imageSearch/imageNotfind.dart';
import 'imageSearch/imageSearchPage.dart';
import 'sets/settingPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JigujicamE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MyAppPage(title: 'JigujicamE')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/load_img.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              color: Color(0xFF6AC99F),
            ),
          ],
        ),
      ),
    );
  }
}

class MyAppPage extends StatefulWidget {
  MyAppPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyAppPage createState() => _MyAppPage();
}

class _MyAppPage extends State<MyAppPage> with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TabBarView(
          children: <Widget>[
            Imagenotfind(),
            CameraScreen(),
            Settingpage(),
          ],
          controller: controller,
        ),
        bottomNavigationBar: Container(
          child: TabBar(
            tabs: <Tab>[
              Tab(
                icon: Icon(Icons.home),
                text: '홈',
              ),
              Tab(
                icon: Icon(Icons.camera),
                text: '이미지 검색',
              ),
              Tab(
                icon: Icon(Icons.settings),
                text: '설정',
              )
            ],
            controller: controller,
            indicatorColor: Color(0xFF), //선택된 라벨 밑줄색
            indicatorWeight: 5, //선택된 라벨 밑줄 굵기
            labelColor: Colors.black, //선택된 탭 색상
            unselectedLabelColor: Colors.white, // 선택되지 않은 탭의 색상
          ),
          color: Color(0xFF6AC99F),
        ));
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
