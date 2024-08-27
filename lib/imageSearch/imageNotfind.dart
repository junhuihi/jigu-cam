import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Imagenotfind extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Imagenotfind();
}

class _Imagenotfind extends State<Imagenotfind> {
  TextEditingController imgName = TextEditingController();
  XFile? _image;

  @override
  void dispose() {
    imgName.dispose();
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
          '이미지인식 실패',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 70, 0, 30),
              child: Text(
                '죄송합니다. 이용에 불편을 드려 죄송합니다.\n학습된 이미지가 아닙니다.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 70),
            Padding(
                padding: EdgeInsets.all(0),
                child: SingleChildScrollView(
                    child: Column(children: [
                  Container(
                    width: 330,
                    height: 30,
                    child: TextField(
                      controller: imgName,
                      decoration: InputDecoration(
                          hintText: '어떤 객체인지 설명해주세요. ex)시계',
                          hintStyle: TextStyle(fontSize: 16)),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(right: 40),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: _pickImage,
                        child: Text(
                          '실패한 이미지 첨부',
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
                  ),
                  SizedBox(height: 40),
                  if (_image != null)
                    Image.file(
                      File(_image!.path),
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                ]))),
            Container(
              width: 300,
              height: 60,
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: TextButton(
                onPressed: () => {
                  if (imgName.text == '')
                    inputIsNull(context)
                  else
                    BtnPopup(context)
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '관리자에게 전달하기\n',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '해당 이미지는 더 많은 쓰레기를 인식하기 위해 활용됩니다.',
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF6AC99F), // 버튼 배경색
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7), // 둥글기 조절
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

//이미지인식 에러 버튼 누르면 뜨는 팝업
void imgError(BuildContext context) {
  TextEditingController imgErrorName = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          '이용에 불편을 드려 죄송합니다.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: Icon(Icons.error, color: Color(0xFF2196F3)),
        content: SingleChildScrollView(
            child: Column(
          children: [
            Text('이미지 인식에 실패했습니다.'),
            Container(
              width: 300,
              height: 30,
            ),
            TextField(
              controller: imgErrorName,
              decoration: InputDecoration(
                  hintText: '올바른 객체 이름을 입력해주세요. ex)시계',
                  hintStyle: TextStyle(fontSize: 16)),
            ),
          ],
        )),
        actions: <Widget>[
          Container(
              width: 330,
              height: 60,
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              color: Color(0xFF6AC99F),
              child: TextButton(
                onPressed: () => {
                  if (imgErrorName.text == '')
                    inputIsNull(context)
                  else
                    {Navigator.pop(context), BtnPopup(context)}
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '관리자에게 전달하기\n',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '해당 이미지는 더 많은 쓰레기를 인식하기 위해 활용됩니다.',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF6AC99F), // 버튼 배경색
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // 둥글기 조절
                  ),
                ),
              )),
        ],
      );
    },
  );
}

//객체 이름 정보 공백일 경우 뜨는 팝업
void inputIsNull(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          '내용을 입력해주세요',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: Icon(Icons.error, color: Color(0xFF2196F3)),
        actions: <Widget>[
          Padding(padding: EdgeInsets.all(0)),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
            child: const Text('확인'),
          ),
        ],
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: EdgeInsets.all(10),
      );
    },
  );
}

//사용자가 이미지랑 객체이름 전송완료 후 뜨는 팝업
void BtnPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          '전송되었습니다.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
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
        content: Text(
          '감사합니다.',
          textAlign: TextAlign.center,
        ),
      );
    },
  );
}
