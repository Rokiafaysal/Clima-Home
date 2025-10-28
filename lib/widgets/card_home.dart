// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CardHome extends StatelessWidget {
  
  final String imageName;
  final String  value;
  final String title;

  const CardHome({
    super.key,
    required this.imageName, required this.value, required this.title,
  });

  @override
  Widget build(BuildContext context) {

    double  width= MediaQuery.of(context).size.width;
 double height= MediaQuery.of(context).size.height;
    return Container(
      width: width * (171 / 390),  
      height: height * (130 / 871),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7FB),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(6, 6),
            blurRadius: 12,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.8),    
            offset: const Offset(-6, -6),
            blurRadius: 12,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.only(top: height*(16.0/871)),
            child: Image.asset(
              imageName,
              width: width * (36 / 390),
              height: height * (36 / 871),
            ),
          ),


          SizedBox(height: height * (16 / 871)),

          Text(
            value,
            style: TextStyle(
              fontSize: width * (20 / 390),
              fontWeight: FontWeight.w700,
              color: Color(0xff0E0E1B),
            ),
          ),

          SizedBox(height: height * (4 / 871)),

          Text(
            title,
            style: TextStyle(
              fontSize: width * (14 / 390),
              fontWeight: FontWeight.w500,
              color: const Color(0xFF4E4E97),
            ),
          ),
        ],
      ),
    );
  }
}
