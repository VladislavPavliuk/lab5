import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const _pixelSize = 25.0;
const _pixelColor = Colors.red;
const _borderColor = Colors.black;
const _borderWidth = 4.0;
const _borderRadius = 5.0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pixel Art Number 4',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Pixel Art Number 4'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildNumberFour(),
        ),
      ),
    );
  }

  List<Widget> _buildNumberFour() {
    return [
      _buildRow([true, false, false, true]),
      _buildRow([true, false, false, true]),
      _buildRow([true, true, true, true]),
      _buildRow([false, false, false, true]),
      _buildRow([false, false, false, true]),
      _buildRow([false, false, false, true]),
    ];
  }

  Widget _buildRow(List<bool> pixels) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: pixels.map((isFilled) => isFilled ? _buildPixel() : _buildEmpty()).toList(),
    );
  }

  Widget _buildPixel() {
    return Container(
      width: _pixelSize,
      height: _pixelSize,
      decoration: BoxDecoration(
        color: _pixelColor,
        borderRadius: BorderRadius.circular(_borderRadius),
        border: Border.all(
          color: _borderColor,
          width: _borderWidth,
        ),
      ),
    );
  }

  Widget _buildEmpty() {
    return const SizedBox(
      width: _pixelSize,
      height: _pixelSize,
    );
  }
}
