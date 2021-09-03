import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_login_page/NavigationAnime.dart';
import 'package:mobile_login_page/lastPageNoidea.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import './constant.dart';

class otpVerify extends StatefulWidget {
  // otpVerify({Key? key}) : super(key: key);
  String phoneNO;
  String verificationID;
  otpVerify({this.phoneNO, this.verificationID});
  @override
  _otpVerifyState createState() =>
      _otpVerifyState(phoneno: phoneNO, verificationIDAuth: verificationID);
}

class _otpVerifyState extends State<otpVerify> {
  @override
  String phoneno;
  String verificationIDAuth;
  _otpVerifyState({this.phoneno, this.verificationIDAuth});
  String smsCode;
  Widget build(BuildContext context) {
    var _flexibleWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _customAppBar(context),
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(12),
                child: Text(
                  'Verify Phone',
                  style: upperStyleText,
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                width: 200,
                height: 32,
                child: Text(
                  'Code is sent to $phoneno',
                  style: lowerStyleText,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                  padding: EdgeInsets.all(8),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 6,
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {
                      setState(() {
                        smsCode = value;
                      });
                    },

                    // backgroundColor: Color(0xFF93D2F3),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(3),
                      fieldHeight: 55,
                      fieldWidth: 50,
                      inactiveFillColor: Color(0xFF93D2F3),
                      selectedFillColor: Color(0xFF93D2F3),
                      activeColor: Color(0xFF93D2F3),
                      inactiveColor: Color(0xFF93D2F3),
                      selectedColor: Color(0xFF93D2F3),
                      activeFillColor: Color(0xFF93D2F3),
                    ),
                    enableActiveFill: true,
                  )),
              Container(
                  margin: EdgeInsets.all(16),
                  child: RichText(
                      text: TextSpan(
                          text: 'Didn’t receive the code? ',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              letterSpacing: 1.5,
                              fontSize: 14,
                              color: Colors.black26,
                              fontWeight: FontWeight.w400),
                          children: [
                        TextSpan(
                            text: 'Request Again',
                            style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.bold,
                            ))
                      ]))),
              ButtonTheme(
                child: ElevatedButton(
                  onPressed: () async {
                    if (smsCode.length != 6) {
                      Fluttertoast.showToast(msg: 'invalid OTP');
                      print('invalidOtp');
                      return;
                    }
                    FirebaseAuth _auth = FirebaseAuth.instance;
                    try {
                      AuthCredential authCredential =
                          PhoneAuthProvider.credential(
                              verificationId: verificationIDAuth,
                              smsCode: smsCode);
                      UserCredential result =
                          await _auth.signInWithCredential(authCredential);
                      if (result.user != null) {
                        Navigator.push(
                            context,
                            SlideRightRoute(
                                page: lastPageNoIdeaRegardingName()));
                      } else {
                        Fluttertoast.showToast(msg: 'Wrong Otp');

                        print('WrongOtp');
                      }
                    } catch (e) {
                      Fluttertoast.showToast(msg: e.toString());
                    }
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.only(
                      top: 0,
                    )),
                    minimumSize: MaterialStateProperty.all(Size(340, 56)),
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF2E3B62)),
                  ),
                  child: Text(
                    'VERIFY AND CONTINUE',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Montserrat',
                        letterSpacing: 1.2),
                  ),
                ),
              ),
            ],
          ),
          SafeArea(
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 250,
              width: double.infinity,
              child: Image(
                alignment: Alignment.bottomCenter,
                image: AssetImage('assets/Wavefinal.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

_customAppBar(var context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(100),
    child: Container(
        margin: EdgeInsets.only(left: 20),
        alignment: Alignment.centerLeft,
        child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset('assets/back.svg'))),
  );
}
