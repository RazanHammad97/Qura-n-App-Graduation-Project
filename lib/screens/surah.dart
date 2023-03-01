import 'package:flutter/material.dart';
class SurahScreen extends StatefulWidget {
  const SurahScreen({Key? key}) : super(key: key);

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Surah"),
    );
  }
}
