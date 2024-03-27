import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  int result = 0;

  void calculateResult() {
    int userInput = int.tryParse(_controller.text) ?? 0;
    double tempResult = 1.4 / (userInput / 100); // 입력값을 소수점으로 변환하여 계산
    tempResult -= 1;
    tempResult *= 10;
    result = tempResult.toInt(); // 결과값을 정수로 변환하여 최종 결과값 구성
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('산소농도 계산기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: '여기에 입력해주세요',
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: calculateResult,
              child: const Text('계산'),
            ),
            const SizedBox(height: 20.0),
            Text(
              '결과: $result',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
