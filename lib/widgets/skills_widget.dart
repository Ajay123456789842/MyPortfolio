import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildSkillCategory(
  String title,
  List<dynamic> skills,
  BuildContext context,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 7),
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: skills
              .map(
                (skill) => Chip(
                  label: Text(
                    skill,
                    style: GoogleFonts.poppins(
                      color: const Color.fromRGBO(100, 255, 218, 1),
                    ),
                  ),
                  backgroundColor: const Color.fromARGB(255, 51, 50, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: const BorderSide(
                    color: Color.fromRGBO(100, 255, 218, 1),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    ),
  );
}
