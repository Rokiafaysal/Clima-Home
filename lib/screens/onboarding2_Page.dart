
import 'package:flutter/material.dart';
import 'package:smart_home_app/screens/Onboarding3_Page.dart';

class Onboarding2Page extends StatelessWidget {
  const Onboarding2Page({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: height * (160.0 / 871)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Text(
              textAlign: TextAlign.center,
              'Your Home \nAdapts to You',
              style: TextStyle(
                color: Color(0xff111118),
                fontSize: 32,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.75,
              ),
            ),
            SizedBox(height: height * (8 / 871)),
            Text(
              'Fans, lights, curtains and garage \n react to weather and motion.',
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
              height: height * (375 / 871),
              child: Image.asset('assets/images/onboarding2.png'),
            ),

            SizedBox(height: height * (22/871)),

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
              ],
            ),

            SizedBox(height: height * (24/871)),

            SizedBox(
              width: width * (140 / 390),
              height: height * (48 / 871),

              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Onboarding3Page()),
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
                  'Continue',
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
