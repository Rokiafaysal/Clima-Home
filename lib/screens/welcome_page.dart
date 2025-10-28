import 'package:flutter/material.dart';
import 'package:smart_home_app/screens/onboarding1_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffF6F6F8),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          SizedBox(
            width: double.infinity,
            height: height * (549 / 871),

            child: Image.asset(
              'assets/images/welcome.png',
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            width: width * (148.5 / 390),
            height: height * (87 / 871),
            child: Image.asset('assets/images/logo4.png', fit: BoxFit.fill),
          ),

          Padding(
            padding: EdgeInsets.only(
              top: height * (6 / 871),
              bottom: height * (24 / 871),
            ),
            child: Text(
              'Control your home\'s comfort \n effortlessly and efficiently.',
              textAlign: TextAlign.center,

              style: TextStyle(
                color: Color(0xff4B5563),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          Container(
            width: width * (140 / 390),
            height: height * (48 / 871),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Color(0xffBBBBF7).withOpacity(0.4),
                  offset: Offset(0, 4),
                  blurRadius: 6,
                  spreadRadius: -4,
                ),

                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Color(0xffBBBBF7).withOpacity(0.4),
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
                  MaterialPageRoute(builder: (context) => Onboarding1Page()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffBBBBF7),
                elevation: 0,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text(
                'Get started',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
