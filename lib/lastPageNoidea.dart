import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './constant.dart';

class lastPageNoIdeaRegardingName extends StatefulWidget {
  // lastPageNoIdeaRegardingName({Key? key}) : super(key: key);

  @override
  _lastPageNoIdeaRegardingNameState createState() =>
      _lastPageNoIdeaRegardingNameState();
}

class _lastPageNoIdeaRegardingNameState
    extends State<lastPageNoIdeaRegardingName> {
  @override
  var pair = [1, 2];
  int _capture = 2;
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please select your profile',
              style: upperStyleText,
            ),
            Container(
              height: 89,
              width: double.infinity,
              margin: EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 12),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Container(
                // title: Text('Join duck community to achieve big in life'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      value: pair[0],
                      groupValue: _capture,
                      onChanged: (int value) {
                        setState(() {
                          _capture = value;
                        });
                      },
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      child: SvgPicture.asset('assets/home.svg'),
                    ),
                    Container(
                      width: 200,
                      height: 80,
                      margin: EdgeInsets.all(4),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Shipper',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 18),
                          ),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing',
                            overflow: TextOverflow.clip,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 89,
              width: double.infinity,
              margin: EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 12),
              // margin: EdgeInsets.all(8),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Container(
                child: Row(
                  children: [
                    Radio(
                      value: pair[1],
                      groupValue: _capture,
                      onChanged: (int value) {
                        setState(() {
                          _capture = value;
                        });
                      },
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: SvgPicture.asset('assets/truck.svg'),
                    ),
                    Container(
                      width: 200,
                      height: 80,
                      margin: EdgeInsets.all(4),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Transporter',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 18),
                          ),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing',
                            overflow: TextOverflow.clip,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            ButtonTheme(
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.only(
                    top: 0,
                  )),
                  minimumSize: MaterialStateProperty.all(Size(360, 56)),
                  backgroundColor: MaterialStateProperty.all(Color(0xFF2E3B62)),
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
      ),
    );
  }
}
