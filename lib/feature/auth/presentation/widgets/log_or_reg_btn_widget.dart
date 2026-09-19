import 'package:flutter/material.dart';

class LogOrRegBtnWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color btnColor;
  final Color textColor;
  final bool isBorder;
  const LogOrRegBtnWidget({
    super.key,
    required this.text,
    required this.onTap,
    required this.btnColor,
    required this.textColor,
    this.isBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(28),
          border: isBorder ? Border.all(color: Colors.white, width: 1.4) : null,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
