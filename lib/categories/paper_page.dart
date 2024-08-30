import 'package:flutter/material.dart';

class PaperPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.recycling, color: Colors.white),
            SizedBox(width: 8), // 아이콘과 텍스트 사이의 간격
            Text(
              '종이류',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff6AC99F),
      ),
      body: Column(
        children: [
          // 이미지 위젯 추가
          Container(
            padding: EdgeInsets.only(
              top: 16.0, // 위쪽에 16픽셀 패딩
              left: 16.0, // 왼쪽에 16픽셀 패딩
              right: 16.0, // 오른쪽에 16픽셀 패딩
              bottom: 0.0, // 아래쪽에는 패딩 없음
            ),
            child: Center(
              child: Image.asset(
                'assets/images/openPaper.png', // 이미지 경로
                height: 200.0, // 원하는 높이로 조정
                fit: BoxFit.scaleDown, // 이미지 크기에 맞게 조정
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30.0), // 전체 패딩 추가
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                      child: Text(
                        '예시',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0), // 왼쪽 여백 추가
                      child: Text(
                        '• 신문, 책, 노트, 상자류, 골판지 등',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                      child: Text(
                        '버리는 방법',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0), // 왼쪽 여백 추가
                      child: Text(
                        '• 종이류와 다른 재질(테이프, 송장, 스프링 등)은 제거한 후 배출',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0, bottom: 8.0),
                      child: Text(
                        '주의',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0), // 왼쪽 여백 추가
                      child: Text(
                        '• 다른 재질과 혼합 구성된 종이는 종량제 봉투에 배출 (영수증, 금(은)박지, 부직포 등)',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
