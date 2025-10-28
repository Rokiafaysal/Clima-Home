import 'package:flutter/material.dart';

class AutoManualToggle extends StatelessWidget {
  const AutoManualToggle({super.key});

  @override
  Widget build(BuildContext context) {
    bool isAuto = true;
    return StatefulBuilder(
      builder: (context, setState) {

         double  width = MediaQuery.of(context).size.width;
         double  height = MediaQuery.of(context).size.height;
        return Container(
          height: height*(48/871),
          width: width*(358/390),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: const Color(0xFFF7F7FB),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => isAuto = true),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: isAuto
                          ? const 
                                Color(0xFFBABAF7)
                             
                          : null,
                      boxShadow: isAuto
                          ? [
                              BoxShadow(
                                color: const Color(0xFFB6AFFF).withOpacity(0.7),
                                blurRadius: 22,
                                spreadRadius:0,
                                offset: const Offset(0, 0),
                              ),
                            ]
                          : [],
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Auto',
                      style: TextStyle(
                        fontSize: 14,
                        color: isAuto ? Colors.white : Color(0xff6B7280),
                        fontWeight:
                            isAuto ? FontWeight.w500 : FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => isAuto = false),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: !isAuto
                          ? const                                 Color(0xFFBABAF7)

                          : null,
                      boxShadow: !isAuto
                          ? [
                              BoxShadow(
                                color: const Color(0xFFB6AFFF).withOpacity(0.7),
                                blurRadius: 22,
                                spreadRadius:0,
                                offset: const Offset(0, 0),
                              ),
                            ]
                          : [],
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Manual',
                      style: TextStyle(
                        fontSize: 14,
                        color: !isAuto ? Colors.white : Color(0xff6B7280),
                        fontWeight:
                            !isAuto ? FontWeight.w500 : FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
