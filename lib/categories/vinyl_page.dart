import 'package:flutter/material.dart';

class VinylPage extends StatelessWidget {
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
              '비닐류',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff6AC99F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // 전체 패딩 추가
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
                  '• 라면, 과자, 커피믹스 등 소포장지\n• 뽁뽁이, 랩, 페트병 라벨 등\n• 색깔 상관없이 비닐 모두',
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
                  '• 내용물을 비우고 물로 헹구는 등 이물질을 제거한 후 배출\n• 흩날리지 않도록 봉투에 담아 제출',
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
                  '• 이물질이 묻은 비닐은 배출 불가',
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
    );
  }
}
