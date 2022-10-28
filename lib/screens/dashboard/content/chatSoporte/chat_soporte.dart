import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../responsive.dart';

class ChatSoporteContent extends StatelessWidget {
  const ChatSoporteContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            children: [
              // MyFiles(),
              ChatWidget(),
              SizedBox(height: defaultPadding),
              // RecentFiles(),
              if (Responsive.isMobile(context))
                SizedBox(height: defaultPadding),
              if (Responsive.isMobile(context)) UserInformation(),
            ],
          ),
        ),
        if (!Responsive.isMobile(context)) SizedBox(width: defaultPadding),
        // On Mobile means if the screen is less than 850 we dont want to show it
        if (!Responsive.isMobile(context))
          Expanded(
            flex: 2,
            child: UserInformation(),
          ),
      ],
    );
  }
}

class UserInformation extends StatelessWidget {
  const UserInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      child: Column(
        children: [
          Text('Maestro'),
          Text('Usuario'),
        ],
      ),
    );
  }
}

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      child: Text('data 1'),
    );
  }
}
