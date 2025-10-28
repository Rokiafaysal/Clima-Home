// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AutoManualToggle extends StatelessWidget {
  final Function(bool) onToggle;

  const AutoManualToggle({super.key, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool isAuto = true; 
        return _ToggleContent(
          onToggle: onToggle,
          isAuto: isAuto,
          setState: setState,
        );
      },
    );
  }
}

class _ToggleContent extends StatefulWidget {
  final Function(bool) onToggle;
  final bool isAuto;
  final void Function(void Function()) setState;

  const _ToggleContent({
    required this.onToggle,
    required this.isAuto,
    required this.setState,
  });

  @override
  State<_ToggleContent> createState() => _ToggleContentState();
}

class _ToggleContentState extends State<_ToggleContent> {
  bool isAutoState = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: height * (48 / 871),
      width: width * (358 / 390),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7FB),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() => isAutoState = true);
                widget.onToggle(true);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: isAutoState
                      ? const Color(0xFFBABAF7) 
                      : const Color(0xFFF7F7FB).withOpacity(0.01),
                  boxShadow: isAutoState
                      ? [
                          BoxShadow(
                            color: const Color(0xFFB6AFFF).withOpacity(0.8),
                            blurRadius: 15,
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
                    color: isAutoState ? Colors.white : const Color(0xff6B7280),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() => isAutoState = false);
                widget.onToggle(false);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: !isAutoState
                     
                      ? const Color(0xFFBABAF7) 
                      : const Color(0xFFF7F7FB).withOpacity(0.01),
                  boxShadow: !isAutoState
                      ? [
                          BoxShadow(
                            color: const Color(0xFFB6AFFF).withOpacity(0.8),
                            blurRadius: 15,
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
                    color:
                        !isAutoState ? Colors.white : const Color(0xff6B7280),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
