import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '팀원 소개 앱',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black, // 배경 색상 설정
      ),
      home: const MyHomePage(title: '팀원을 소개합니다~~~~~~!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 버튼 클릭 시 이벤트 처리
  void buttonClicked() {
    print("Elevated Button이 클릭되었습니다.");
  }

  @override
  Widget build(BuildContext context) {
    double imageWidth = MediaQuery.of(context).size.width / 3; // 화면 폭의 1/3 크기

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          // 상단 배경 이미지 - 화면 상단에만 배치
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 200, // 배경 이미지의 높이를 지정하여 상단에만 위치시킴
            child: Image.asset(
              'images/ft-island.png', // 배경 이미지 경로
              fit: BoxFit.cover,
            ),
          ),
          // 팀원 소개 내용
          Positioned.fill(
            top: 220, // 배경 이미지 하단부터 팀원 소개가 시작되도록 설정
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "팀명: FT-ieland", // 팀명 추가
                    style: TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "우리 팀원들",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.deepOrange,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // 첫 번째 Row - Children 3개
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      StackWithBadge(TeamMemberCard(imagePath: 'images/수진.jpg', name: '수진'), '1'), // 로컬 이미지 경로
                      StackWithBadge(TeamLeaderCard(imagePath: 'images/연우.png', name: '팀장 연우'), '3'), // 팀장 연우 강조
                      StackWithBadge(TeamMemberCard(imagePath: 'images/나린.png', name: '나린'), '1'), // 로컬 이미지 경로
                    ],
                  ),
                  const SizedBox(height: 40),
                  // 두 번째 Row - Children 2개
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      StackWithBadge(TeamMemberCard(imagePath: 'images/상현.png', name: '상현'), '4'), // 로컬 이미지 경로
                      StackWithBadge(TeamMemberCard(imagePath: 'images/현지.jpg', name: '현지'), '1'), // 로컬 이미지 경로
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: buttonClicked,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amberAccent, // 버튼 배경색
                    ),
                    child: const Text("팀원 참여하기"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 팀원 카드를 정의한 클래스
class TeamMemberCard extends StatelessWidget {
  final String imagePath;
  final String name;

  const TeamMemberCard({super.key, required this.imagePath, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Image.asset(
            imagePath,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

// 팀장을 강조한 카드
class TeamLeaderCard extends StatelessWidget {
  final String imagePath;
  final String name;

  const TeamLeaderCard({super.key, required this.imagePath, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.yellow, // 팀장을 강조하기 위한 테두리 색상
              width: 4.0,
            ),
          ),
          child: ClipOval(
            child: Image.asset(
              imagePath,
              width: 80, // 팀장 이미지를 더 크게
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          name,
          style: const TextStyle(
            fontSize: 18, // 팀장 이름 글자 크기를 더 크게
            fontWeight: FontWeight.bold, // 강조된 텍스트 스타일
            color: Colors.yellow, // 팀장 이름 색상 변경
          ),
        ),
      ],
    );
  }
}

// Stack 위젯을 이용해 숫자 뱃지 추가
class StackWithBadge extends StatelessWidget {
  final Widget teamMemberCard;
  final String badgeNumber;

  const StackWithBadge(this.teamMemberCard, this.badgeNumber);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        teamMemberCard,
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: Text(
              badgeNumber,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
