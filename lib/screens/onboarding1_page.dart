// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:smart_home_app/screens/onboarding2_Page.dart';

class Onboarding1Page extends StatelessWidget {
  const Onboarding1Page({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: height * (152.0 / 871)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Text(
              'Monitor Your \nEnvironment',
              // textAlign: TextAlign.center,

              style: TextStyle(
                color: Color(0xff111118),
                fontSize: 32,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.8,
              ),
            ),
            SizedBox(height: height * (8 / 871)),

            Text(
              'Real-time temperature, light, and \n rain data from smart sensors.',
              textAlign: TextAlign.center,

              style: TextStyle(
                color: Color(0xff95A1AA),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: height * (8 / 871)),

            SizedBox(
              width: double.infinity,
              height: height * (396 / 871),
              child: Image.asset('assets/images/onboarding1.png'),
            ),



            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width:  width* (8/390),
                  height: height*(8/871),
                  decoration: BoxDecoration(
                    color: Color(0xFFBBBBF7),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: width*(12/390)),
                Container(
                  width:  width* (8/390),
                  height: height*(8/871),
                  decoration: BoxDecoration(
                    color: Color(0xFFBBBBF7).withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: width*(12/390)),
                Container(
                  width:  width* (8/390),
                  height: height*(8/871),
                  decoration: BoxDecoration(
                    color: Color(0xFFBBBBF7).withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),

            SizedBox(height: height * (24/871)),


            Container(
              width: width * (140 / 390),
              height: height * (48 / 871),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0, 2),
                    blurRadius: 4,
                    spreadRadius: -2,
                  ),

                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0, 4),
                    blurRadius: 6,
                    spreadRadius: -1,
                  ),
                ],
                borderRadius: BorderRadius.circular(24),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Onboarding2Page()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,

                  backgroundColor: Color(0xffBBBBF7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Color(0xff111118),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
