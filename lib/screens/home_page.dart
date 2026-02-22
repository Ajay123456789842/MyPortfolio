import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/portfolio_data.dart';
import '../widgets/no_scrollbar_behavior.dart';
import '../widgets/section_title_with_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 800;
    return ScrollConfiguration(
      behavior: NoScrollbarBehavior(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isDesktop
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Hello,My name is\n",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: "Ajay Bathula\n\n",
                            style: GoogleFonts.poppins(
                              fontSize: 38,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: '${portfolioData['tagline']}',
                            style: GoogleFonts.poppins(
                              fontSize: 28,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 320,
                    height: 320,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color.fromRGBO(100, 255, 218, 1),
                        width: 3,
                      ),
                    ),
                    child: ClipOval(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.asset("assets/images/profile.png"),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color.fromRGBO(100, 255, 218, 1),
                          width: 3,
                        ),
                      ),
                      child: ClipOval(
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: SizedBox(
                            width: 200,
                            height: 200,
                            child: Image.asset("assets/images/profile.png"),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Hello, I\'m Ajay',
                      style: GoogleFonts.poppins(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      portfolioData["tagline"]!,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
