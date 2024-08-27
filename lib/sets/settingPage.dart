import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../imageSearch/imageNotfind.dart';

// 설정화면
class Settingpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Settingpage();
}

class _Settingpage extends State<Settingpage> {
  List<List<String>> team = [
    ['김준희', '김지희', '김채원', '신서연', '이현수'],
    [
      'https://github.com/junhuihi',
      'https://github.com/romdyfo',
      'https://github.com/one-chae',
      'https://github.com/seoyeon0918',
      'https://github.com/stella9921'
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF6AC99F),
        title: Text(
          '설정',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: ListView(children: <Widget>[
        ListTile(
          title: Text('버전 0.0.1'),
        ),
        Divider(height: 1),
        ListTile(
          title: Text('개발자 정보'),
          onTap: () {
            teamInfo(context);
          },
        ),
        Divider(height: 1),
        ListTile(
          title: Text('문의하기'),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Askpage()));
          },
        ),
        Divider(height: 1),
      ]),
    );
  }

  void teamInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '개발자 정보',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: team[0].length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(team[0][index]),
                  subtitle: Text(team[1][index]),
                );
              },
            ),
          ),
          actions: <Widget>[
            Padding(padding: EdgeInsets.all(0)),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('닫기'),
            ),
          ],
          actionsPadding: EdgeInsets.all(10),
        );
      },
    );
  }
}

// 문의하기 페이지
class Askpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Askpage();
}

class _Askpage extends State<Askpage> {
  TextEditingController askName1 = TextEditingController();
  TextEditingController askName2 = TextEditingController();
  XFile? _image;

  @override
  void dispose() {
    askName1.dispose();
    askName2.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF6AC99F),
          title: Text(
            '문의하기',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 10.0), // 간격
              Text('제목', style: TextStyle(fontSize: 16)),
              TextField(
                controller: askName1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0), // 간격
              Text('문의 내용', style: TextStyle(fontSize: 16)),
              TextField(
                minLines: 6,
                maxLines: 6,
                controller: askName2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.0),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: _pickImage,
                  child: Text(
                    '관련 이미지 첨부',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10, vertical: 8), // 패딩을 줄여 버튼 크기 줄임
                    minimumSize: Size(100, 30), // 버튼 크기 조정
                    backgroundColor: Color(0xFFC0C0C0), // 버튼 배경색
                    foregroundColor: Color(0xFFFFFFFF), // 버튼 텍스트 색상
                    side: BorderSide(
                      color: Color(0xFF828282), // 테두리 색상
                      width: 1, // 테두리 두께
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5), // 둥글기 조절
                    ),
                  ),
                ),
              ),
              if (_image != null)
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Image.file(
                    File(_image!.path),
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              SizedBox(height: 40.0),
              Center(
                child: Container(
                  width: 250,
                  height: 40,
                  padding: EdgeInsets.all(0),
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: TextButton(
                    onPressed: () => {
                      if (askName1.text == '' || askName2.text == '')
                        inputIsNull(context)
                      else
                        BtnPopup(context)
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF6AC99F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      '문의 접수하기',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ])));
  }
}
