import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/widgets/certifications_card.dart';
import 'package:my_portfolio/widgets/skills_widget.dart';

import '../data/portfolio_data.dart';
import '../widgets/no_scrollbar_behavior.dart';
import '../widgets/section_title_with_content.dart';
import '../widgets/work_experience_card.dart';
import '../widgets/education_card.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoScrollbarBehavior(),
      child: Column(
        // padding: const EdgeInsets.all(16.0),
        children: [
          SectionTitleWithContent(
            title: '# Professional Background',
            child: Divider(color: Colors.grey.shade600, thickness: 1),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              portfolioData["professionalSummary"]!,
              textAlign: TextAlign.start,

              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16,
                //height: 1.6,
              ),
            ),
          ),

          SectionTitleWithContent(
            title: 'Skills & Technologies',
            icon: Icons.code,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSkillCategory(
                  "Languages",
                  portfolioData["skills"]["languages"],
                  context,
                ),
                buildSkillCategory(
                  "Databases",
                  portfolioData["skills"]["databases"],
                  context,
                ),
                buildSkillCategory(
                  "API Integration",
                  portfolioData["skills"]["api"],
                  context,
                ),
                buildSkillCategory(
                  "State Management",
                  portfolioData["skills"]["stateManagement"],
                  context,
                ),
                buildSkillCategory(
                  "Tools",
                  portfolioData["skills"]["tools"],
                  context,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          SectionTitleWithContent(
            title: 'Work Experience',
            icon: Icons.work,
            child: Column(
              children: [
                for (var exp in portfolioData["workExperience"])
                  buildExperienceCard(context, exp),
              ],
            ),
          ),
          const SizedBox(height: 24),
          SectionTitleWithContent(
            title: 'Certifications',
            icon: Icons.bookmark,
            child: Column(
              children: [
                buildCertificationsCard(
                  context,
                  portfolioData["certifications"],
                ),
              ],
            ),
          ),
          SectionTitleWithContent(
            title: 'Education',
            icon: Icons.school,
            child: Column(
              children: [
                for (var edu in portfolioData["education"])
                  buildEducationCard(context, edu),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
