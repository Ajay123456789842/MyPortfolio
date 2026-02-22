import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionTitleWithContent extends StatelessWidget {
  final String? title;
  final Widget child;
  final IconData? icon;

  const SectionTitleWithContent({
    super.key,
    this.title,
    required this.child,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: const Color.fromRGBO(100, 255, 218, 1)),
              const SizedBox(width: 8),
            ],
            Text(
              title!,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(100, 255, 218, 1),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        child,
      ],
    );
  }
}
