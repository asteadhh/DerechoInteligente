import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../../../../constants/app_constants.dart';
import '../../../../constants/custom_colors copy.dart';

class FullPhotoPage extends StatelessWidget {
  final String url;

  const FullPhotoPage({required this.url, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: CustomColors.jurixNavy,
        ),
        title: Text(
          AppConstants.fullPhotoTitle,
          style: TextStyle(
            color: CustomColors.jurixNavy,
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
