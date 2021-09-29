import 'package:flutter/material.dart';
import 'package:quit_smoking_app/constants.dart';
import 'package:quit_smoking_app/home/home.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:shared_preferences/shared_preferences.dart';

//STREAMING OBJECT
import "package:quit_smoking_app/MyAppStreamObject.dart";

//STREAMING SHARED PREFERENCE
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class WelcomeButton extends StatelessWidget {
  final MyAppStreamObject? myAppStreamObject;
  WelcomeButton({this.myAppStreamObject});

  setRegisterDate() async {
    DateTime now = DateTime.now();
    this.myAppStreamObject?.registerDate.setValue(now.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 4,
            blurRadius: 9,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        color: Color(0xff5f225d),
      ),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: () async {
          await setRegisterDate();
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  Home(myAppStreamObject: myAppStreamObject)));
        },
        child: Text(
          'hadi başlayalım!'.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
