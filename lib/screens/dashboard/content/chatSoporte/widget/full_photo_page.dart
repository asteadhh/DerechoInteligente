import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:photo_view/photo_view.dart';

import '../../../../../constants/app_constants.dart';

class FullPhotoPage extends StatelessWidget {
  final String url;

  const FullPhotoPage({required this.url, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).backgroundColor,
        ),
        title: PlatformText(
          AppConstants.fullPhotoTitle,
          style: TextStyle(
            color: Theme.of(context).backgroundColor,
          ),
        ),
      ),
      body: Container(
        child: PhotoView(
          imageProvider: NetworkImage(url),
        ),
      ),
    );
  }
}
