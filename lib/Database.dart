import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './otpVerification.dart';
import 'NavigationAnime.dart';

class DataBase {
  Future<bool> loginUser(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.of(context).pop();

          UserCredential result = await _auth.signInWithCredential(credential);

          User user = result.user;
          //not asked so not implmented

          if (user != null) {
            print('Done');
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => HomeScreen(
            //               user: user,
            //             )));
          } else {
            print("Error");
          }

          //This callback would gets called when verification is done auto maticlly
        },
        verificationFailed: (var exception) {
          print(exception);
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          print(verificationId);
          print(forceResendingToken);
          Navigator.push(
              context,
              SlideRightRoute(
                  page: otpVerify(
                phoneNO: phone,
                verificationID: verificationId,
              )));
        },
        codeAutoRetrievalTimeout: null);
  }
}
