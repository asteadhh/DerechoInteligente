// import 'dart:html';
// import 'package:flutter/material.dart';
// import 'dart:ui' as ui;

// class PlatformImageViewWidget extends StatelessWidget {
//   PlatformImageViewWidget(this.imageUrl);
//   String imageUrl;
//   @override
//   Widget build(BuildContext context) {
//     // https://github.com/flutter/flutter/issues/41563
//     // ignore: undefined_prefixed_name
//     ui.platformViewRegistry.registerViewFactory(
//       imageUrl,
//       (int _) => ImageElement()..src = imageUrl,
//     );
//     return HtmlElementView(
//       viewType: imageUrl,
//     );
//   }
// }
