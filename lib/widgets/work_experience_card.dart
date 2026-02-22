import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildExperienceCard(BuildContext context, Map<String, dynamic> exp) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            exp["role"],
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color.fromRGBO(100, 255, 218, 1),
            ),
          ),
          Text(
            exp["company"],
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: const Color.fromRGBO(100, 255, 218, 1),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            exp["duration"],
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: Colors.grey.shade500,
            ),
          ),
          const SizedBox(height: 8),
          for (var res in exp["responsibilities"])
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    size: 16,
                    color: Color.fromRGBO(100, 255, 218, 1),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      res,
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    ),
  );
}
