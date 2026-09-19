import 'package:flutter/material.dart';

class PreSectionWidget extends StatelessWidget {
  final String title;
  final bool showSeeAll;
  const PreSectionWidget({
    required this.title,
    required this.showSeeAll,
    super.key,
  });

  @override
  build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        showSeeAll
            ? GestureDetector(
                child: Row(
                  spacing: 10,
                  children: [
                    Text(
                      'See All',
                      style: TextStyle(
                        color: Color(0xFFFCC434),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFFFCC434),
                      size: 18,
                    ),
                  ],
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
