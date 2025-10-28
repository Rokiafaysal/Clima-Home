// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:smart_home_app/screens/dashBoard_Page.dart';

class Onboarding3Page extends StatelessWidget {
  const Onboarding3Page({super.key});

  @override
  Widget build(BuildContext context) {
   double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: height * (174.0 / 871)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Text(
              textAlign: TextAlign.center,
              'Comfort and Efficiency',
              style: TextStyle(
                color: Color(0xff0E0E1B),
                fontSize: 30,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.75,
              ),
            ),
            SizedBox(height: height * (8 / 871)),
            Text(
              'AI forecast and smart rules help you  \n save energy while staying comfortable.',
              textAlign: TextAlign.center,

              style: TextStyle(
                color: Color(0xff919CA4),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: height * (8 / 871)),

            SizedBox(
              width: double.infinity,
              height: height * (360 / 871),
              child: Image.asset('assets/images/onboarding3.png'),
            ),

            SizedBox(height: height * (16/871)),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                SizedBox(width: width*(12/390)),
                Container(
                  width:  width* (8/390),
                  height: height*(8/871),
                  decoration: BoxDecoration(
                    color: Color(0xFFBBBBF7),
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
                    color: Color(0xFFBBBBF7).withOpacity(0.3),
                    offset: Offset(0, 4),
                    blurRadius: 6,
                    spreadRadius: -4,
                  ),

                  BoxShadow(
                    color: Color(0xFFBBBBF7).withOpacity(0.3),
                    offset: Offset(0, 10),
                    blurRadius: 15,
                    spreadRadius: -3,
                  ),
                ],
                borderRadius: BorderRadius.circular(24),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardPage()),
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
                  'Let\'s Go',
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
