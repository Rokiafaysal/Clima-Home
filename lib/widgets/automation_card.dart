// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AutomationCard extends StatefulWidget {
  final Function(bool isAuto) onSwitch;
  final bool initialAuto;
  final String text;
  final String hintText;
  final String imageName;

  const AutomationCard({
    super.key,
    required this.onSwitch,
    this.initialAuto = false,
    required this.text,
    required this.hintText,
    required this.imageName,
  });

  @override
  State<AutomationCard> createState() => _AutoRuleCardState();
}

class _AutoRuleCardState extends State<AutomationCard> {
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
      height: height * (101 / 871),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            offset: Offset(-8, -8),
            blurRadius: 16,
          ),
          BoxShadow(
            color: Color(0xffD1D1D6),
            offset: Offset(8, 8),
            blurRadius: 16,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: [
            Image.asset(widget.imageName),
            SizedBox(width: width * (25 / 390)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.text,
                  softWrap: true,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff0E0E1B),
                  ),
                ),
                // SizedBox(height: height * (2 / 850)),
                Text(
                  widget.hintText,
                  softWrap: true,

                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff6B7280),
                  ),
                ),
              ],
            ),
            const Spacer(),
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
                        const BoxShadow(
                          color: Color.fromARGB(255, 255, 255, 255),
                          blurRadius: 8,
                          offset: Offset(-8, -8),
                        ),
                         BoxShadow(
              color: const Color.fromARGB(255, 220, 220, 220)
                  .withOpacity(0.5),
                        blurRadius: 5,
              offset: const Offset(0, 0),
            ),
                      ],
              ),
              child: Switch(
                value: isAuto,
                activeColor: Colors.white,
                inactiveThumbColor: Colors.white,
                activeTrackColor: const Color(0xFFBABAF7),

    inactiveTrackColor: const Color(0xFFBABAF7).withOpacity(0.1), 
                onChanged: (value) {
                  setState(() => isAuto = value);
                  widget.onSwitch(isAuto);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
