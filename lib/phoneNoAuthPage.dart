import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_login_page/Database.dart';
import 'package:mobile_login_page/NavigationAnime.dart';
import 'package:mobile_login_page/otpVerification.dart';
import './constant.dart';

class phoneNoAuth extends StatefulWidget {
  // phoneNoAuth({Key? key}) : super(key: key);

  @override
  _phoneNoAuthState createState() => _phoneNoAuthState();
}

class _phoneNoAuthState extends State<phoneNoAuth> {
  @override
  String _dropdownCountry = '+91';
  TextEditingController _controller = new TextEditingController();
  _decideFlag() {
    if (_dropdownCountry == '+1') {
      return '🇨🇦';
    } else if (_dropdownCountry == '+44') {
      return '🇦🇺';
    } else {
      return '🇮🇳';
    }
  }

  var _flag = '🇮🇳';
  Widget build(BuildContext context) {
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
                  'Please Enter your mobile number',
                  style: upperStyleText,
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                width: 200,
                height: 32,
                child: Text(
                  'You’ll receive a 6 digit code to verify next.',
                  style: lowerStyleText,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 48,
                width: double.infinity,
                margin: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 12),
                      child: Text(
                        '$_flag',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    DropdownButton(
                      hint: _dropdownCountry == null
                          ? Text('+91', style: dropdownStyleNew)
                          : Text(
                              _dropdownCountry,
                              style: dropdownStyle,
                            ),
                      isExpanded: false,
                      iconSize: 15.0,
                      underline: Container(),
                      style: TextStyle(color: Colors.black),
                      items: ['+91', '+1', '+44'].map(
                        (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(
                          () {
                            _dropdownCountry = val;
                            _flag = _decideFlag();
                          },
                        );
                      },
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(top: 10, bottom: 4, left: 5),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: _controller,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: Colors.black26,
                                  letterSpacing: 2.2,
                                  fontWeight: FontWeight.w400),
                              hintText: 'Mobile Number'),
                        ),
                      ),
                    )
                  ],
                ),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
              ),
              ButtonTheme(
                child: ElevatedButton(
                  onPressed: () {
                    if (_controller.text.length != 10) {
                      print('Invalid No');
                      Fluttertoast.showToast(msg: 'invalid PhoneNo');

                      return;
                    }
                    DataBase().loginUser(
                        _dropdownCountry + _controller.text, context);
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
                    'CONTINUE',
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
          Container(
            alignment: Alignment.bottomCenter,
            height: 300,
            width: double.infinity,
            child: Image(
              alignment: Alignment.bottomCenter,
              image: AssetImage('assets/Wavefinal.png'),
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
            child: SvgPicture.asset('assets/cross.svg'))),
  );
}
