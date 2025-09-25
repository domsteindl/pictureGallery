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
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          ClipOval(
            child: Image.asset(
              'assets/images/kaya.jpeg',
              width: 250,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Text("Dominik Steindl", style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w400),),
          Text("Softwareentwickler", style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),),
          SizedBox(height: 25,),
          Text(fileContent.replaceAll('"', '').replaceAll(r'\n', '\n')),
        ],
      ),
    );
  }
}
