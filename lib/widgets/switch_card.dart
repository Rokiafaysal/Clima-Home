// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class SwitchCard extends StatefulWidget {
  final Function(bool isAuto) onSwitch;

  final String title;

  final String imagePath;

  final bool initialAuto;

  const SwitchCard({
    super.key,
    required this.onSwitch,
    required this.title,
    required this.imagePath,
    this.initialAuto = false,
  });

  @override
  State<SwitchCard> createState() => _FanSwitchCardState();
}

class _FanSwitchCardState extends State<SwitchCard> {
  late bool isAuto;

  @override
  void initState() {
    super.initState();
    isAuto = widget.initialAuto;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: height * (96 / 871),
      decoration: BoxDecoration(
        color: const Color(0xffF7F7FB),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            blurRadius: 12,
            offset: Offset(-6, -6),
          ),
          BoxShadow(
            color: Color(0xFFE6E6EA),
            blurRadius: 12,
            offset: Offset(6, 6),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: width * (16 / 390)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: width*(  56/390),
                height: height*(56/871),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F7FB),
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-6, -6),
                      blurRadius: 12,
                    ),
                    BoxShadow(
                      color: Color(0xFFE6E6EA),
                      offset: Offset(6, 6),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(0.4),
                            Colors.black.withOpacity(0.001),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        widget.imagePath,
                        width: width*(37/390),
                        height: height*(37/871),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: width * (12 / 390)),
              Text(
                widget.title,
                style: const TextStyle(
                  color: Color(0xff0E0E1B),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          Row(
            children: [
              SizedBox(width: width * (8 / 390)),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  boxShadow: isAuto
                      ? [
                          BoxShadow(
                            color: const Color(0xFFB6AFFF).withOpacity(0.6),
                            blurRadius: 20,
                            offset: const Offset(0, 0),
                          ),
                        ]
                      : [
                          BoxShadow(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            blurRadius: 8,
                            offset: const Offset(-8, -8),
                          ),
                          BoxShadow(
                            color: const Color.fromARGB(
                              255,
                              213,
                              213,
                              213,
                            ).withOpacity(0.7),
                            blurRadius: 7,
                            offset: const Offset(0, 0),
                          ),
                        ],
                ),
                child: Switch(
                  value: isAuto,
                  activeColor: Colors.white,
                  inactiveThumbColor: Colors.white,
                  // trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
                  activeTrackColor: const Color(0xFFBABAF7),
                  inactiveTrackColor: Color(0xFFBABAF7).withOpacity(0.2),
                  onChanged: (value) {
                    setState(() => isAuto = value);
                    widget.onSwitch(isAuto);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
