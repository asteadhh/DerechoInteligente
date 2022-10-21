import '../../constants/custom_colors.dart';
import '../../controllers/MenuController.dart';
import '/screens/home_page.dart';
import '/utils/authentication.dart';
import 'package:flutter/material.dart';

class FacebookButton extends StatefulWidget {
  @override
  _FacebookButtonState createState() => _FacebookButtonState();
}

class _FacebookButtonState extends State<FacebookButton> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.blueGrey, width: 3),
        ),
        color: Colors.white,
      ),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.blueGrey.shade100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.blueGrey, width: 3),
          ),
          elevation: 0,
        ),
        onPressed: () async {
          setState(() {
            MenuController().isProcessing.value = true;
          });
          await signInWithGoogle().then((result) {
            print(result);
            if (result != null) {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => Home(),
                ),
              );
            }
          }).catchError((error) {
            print('Registration Error: $error');
          });
          setState(() {
            MenuController().isProcessing.value = false;
          });
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: MenuController().isProcessing.value
              ? CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(
                    Colors.blueGrey,
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/images/facebook.png"),
                      height: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Continue with Facebook',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blueGrey,
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
