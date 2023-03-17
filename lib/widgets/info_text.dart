import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoText extends StatelessWidget {
  final String type;
  final String text;
  String? link;

  InfoText({
    required this.type,
    required this.text,
    this.link,
  });
  _launchURL(url) async {
    // const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PlatformText(
          '$type: ',
          style: TextStyle(
            color: Colors.blueGrey[300],
            fontSize: 16,
          ),
        ),
        Flexible(
          child: link != null
              ? GestureDetector(
                  child: PlatformText(
                    text,
                    style: TextStyle(
                      color: Colors.blueGrey[100],
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    _launchURL(link);
                  },
                )
              : PlatformText(
                  text,
                  style: TextStyle(
                    color: Colors.blueGrey[100],
                    fontSize: 16,
                  ),
                ),
        )
      ],
    );
  }
}
