import 'package:flutter/material.dart';

class MovieExpandableOverview extends StatefulWidget {
  final String overview;

  const MovieExpandableOverview({super.key, required this.overview});

  @override
  State<MovieExpandableOverview> createState() =>
      _MovieExpandableOverviewState();
}

class _MovieExpandableOverviewState extends State<MovieExpandableOverview> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final text = widget.overview.isNotEmpty
        ? widget.overview
        : 'No description available.';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          maxLines: expanded ? null : 4,
          overflow: expanded ? TextOverflow.visible : TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.8),
            fontSize: 14,
            height: 1.5,
          ),
        ),
        if (text.length > 120)
          GestureDetector(
            onTap: () => setState(() => expanded = !expanded),
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                expanded ? 'See less' : 'See more',
                style: const TextStyle(
                  color: Color(0xFFFCC434),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
