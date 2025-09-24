import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class AboutMeScreen extends StatefulWidget {
  const AboutMeScreen({super.key});

  @override
  State<AboutMeScreen> createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  String fileContent = '';
  Future<String> loadAssetText() async {
    return await rootBundle.loadString('assets/text/kaya_müller_text.txt');
  }

  @override
  void initState() {
    super.initState();
    loadAssetText().then((data) {
      setState(() {
        fileContent = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          
          ClipRRect(child: Image.asset('assets/images/kaya.jpeg')),
          Text("Fotograf"),
          Text(fileContent),
        ],
      ),
    );
  }
}
