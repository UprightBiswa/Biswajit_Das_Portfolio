import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumeScreen extends StatelessWidget {
  final String resumeUrl = "https://your-resume-link.pdf";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Resume")),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () => _launchURL(resumeUrl),
          icon: Icon(Icons.download),
          label: Text("Download Resume"),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }
}
