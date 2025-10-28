// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';


class CircleCard extends StatelessWidget {


  final Color? color; 
  final String image ;
  final String name;



  const CircleCard({super.key, this.color, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
      double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return                 Container(
                  width: width * (80 / 390),
                  height: height * (80 / 781),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:color ?? Color(0xffF7F7FB)  ,

                                    boxShadow: [
                                        BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    offset: const Offset(4, 4),
                    blurRadius: 8,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.8),
                    offset: const Offset(-4, -4),
                    blurRadius: 8,
                    spreadRadius: 0,
                  ),
                
                  
                ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 24,
                        height: 21,
                        child: Image.asset( image),
                      ),

                      Text(
                        name,
                        style: TextStyle(
                          color: Color(0xff0E0E1B),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
  }
}