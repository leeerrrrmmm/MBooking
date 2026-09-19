import 'package:flutter/material.dart';

class CheckBoxRowWidget extends StatefulWidget {
  final String label;
  final VoidCallback onChanged;
  final bool value;

  const CheckBoxRowWidget({
    super.key,
    required this.label,
    required this.onChanged,
    required this.value,
  });

  @override
  State<CheckBoxRowWidget> createState() => _CheckBoxRowWidgetState();
}

class _CheckBoxRowWidgetState extends State<CheckBoxRowWidget> {
  @override
  build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: widget.value,
          onChanged: (value) => widget.onChanged(),
          visualDensity: VisualDensity.compact,
          checkColor: Colors.transparent,
          side: BorderSide.none,
          fillColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.selected)) {
              return const Color(0xFFFCC434);
            }
            return const Color(0xFFBFBFBF);
          }),
        ),
        Text(
          widget.label,
          style: TextStyle(color: Color(0xFFBFBFBF), fontSize: 16),
        ),
      ],
    );
  }
}
