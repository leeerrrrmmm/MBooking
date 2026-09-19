import 'package:flutter/material.dart';

class WelcomeBackTextWidget extends StatelessWidget {
  final String userName;
  const WelcomeBackTextWidget({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text('Hello, $userName!', style: TextStyle(fontSize: 20)),
            Text(
              'Welcome back',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications, color: Colors.white, size: 42),
        ),
      ],
    );
  }
}
