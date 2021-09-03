import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_login_page/phoneNoAuthPage.dart';
import './constant.dart';
import './NavigationAnime.dart';

class LanguageChoice extends StatefulWidget {
  @override
  _languageChoice createState() => _languageChoice();
}

class _languageChoice extends State<LanguageChoice> {
  @override
  String _dropDownValue;

  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.all(16),
                child: SvgPicture.asset('assets/mainframe.svg')),
            Container(
              margin: EdgeInsets.all(12),
              child: Text(
                'Please select your Language',
                style: upperStyleText,
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              width: 200,
              height: 32,
              child: Text(
                ' You can change the language at any time.',
                style: lowerStyleText,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: 48,
              width: 248,
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: _dropDownValue == null
                          ? Colors.black12
                          : Colors.black)),
              child: DropdownButton(
                hint: _dropDownValue == null
                    ? Text('English', style: dropdownStyleNew)
                    : Text(
                        _dropDownValue,
                        style: dropdownStyle,
                      ),
                isExpanded: true,
                isDense: true,
                iconSize: 30.0,
                underline: Container(),
                style: TextStyle(color: Colors.black),
                items: ['English', 'Hindi', 'Tamil'].map(
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
                      _dropDownValue = val;
                    },
                  );
                },
              ),
            ),
            ButtonTheme(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, SlideRightRoute(page: phoneNoAuth()));
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.only(
                    top: 0,
                  )),
                  minimumSize: MaterialStateProperty.all(Size(248, 48)),
                  backgroundColor: MaterialStateProperty.all(Color(0xFF2E3B62)),
                ),
                child: Text(
                  'NEXT',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Montserrat',
                      letterSpacing: 1.1),
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
      ]),
    );
  }
}
