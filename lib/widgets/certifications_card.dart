import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/data/portfolio_data.dart';
import 'package:my_portfolio/widgets/section_title_with_content.dart';

Widget buildCertificationsCard(
  BuildContext context,
  List<String> certifications,
) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.only(bottom: 16),
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (String certi in certifications)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.check_circle_outline,
                      size: 16,
                      color: Color(0xFF64FFDA),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        certi,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    ),
  );
}
