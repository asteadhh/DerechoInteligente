import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomBarColumn extends StatelessWidget {
  final String heading;
  final String s1;
  String? s1Link;
  final String s2;
  String? s2Link;
  final String s3;
  String? s3Link;
  var s1Page;
  var s2Page;
  var s3Page;

  BottomBarColumn({
    required this.heading,
    required this.s1,
    required this.s2,
    required this.s3,
    this.s1Link,
    this.s2Link,
    this.s3Link,
    this.s1Page,
    this.s2Page,
    this.s3Page,
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
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(
              color: Colors.blueGrey[300],
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          s1Page != null
              ? GestureDetector(
                  child: Text(
                    s1,
                    style: TextStyle(
                      color: Colors.blueGrey[100],
                      fontSize: 14,
                    ),
                  ),
                  onTap: s1Page,
                )
              : s1Link != null
                  ? GestureDetector(
                      child: Text(
                        s1,
                        style: TextStyle(
                          color: Colors.blueGrey[100],
                          fontSize: 14,
                        ),
                      ),
                      onTap: () {
                        _launchURL(s1Link);
                      },
                    )
                  : Text(
                      s1,
                      style: TextStyle(
                        color: Colors.blueGrey[100],
                        fontSize: 14,
                      ),
                    ),
          SizedBox(height: 5),
          s2Page != null
              ? GestureDetector(
                  child: Text(
                    s2,
                    style: TextStyle(
                      color: Colors.blueGrey[100],
                      fontSize: 14,
                    ),
                  ),
                  onTap: s2Page,
                )
              : s2Link != null
                  ? GestureDetector(
                      onTap: () {
                        _launchURL(s2Link);
                      },
                      child: Text(
                        s2,
                        style: TextStyle(
                          color: Colors.blueGrey[100],
                          fontSize: 14,
                        ),
                      ),
                    )
                  : Text(
                      s2,
                      style: TextStyle(
                        color: Colors.blueGrey[100],
                        fontSize: 14,
                      ),
                    ),
          SizedBox(height: 5),
          s3Page != null
              ? GestureDetector(
                  child: Text(
                    s3,
                    style: TextStyle(
                      color: Colors.blueGrey[100],
                      fontSize: 14,
                    ),
                  ),
                  onTap: s3Page,
                )
              : s3Link != null
                  ? GestureDetector(
                      onTap: () {
                        _launchURL(s3Link);
                      },
                      child: Text(
                        s3,
                        style: TextStyle(
                          color: Colors.blueGrey[100],
                          fontSize: 14,
                        ),
                      ),
                    )
                  : Text(
                      s3,
                      style: TextStyle(
                        color: Colors.blueGrey[100],
                        fontSize: 14,
                      ),
                    ),
        ],
      ),
    );
  }
}
