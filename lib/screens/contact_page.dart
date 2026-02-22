import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/portfolio_data.dart';
import '../widgets/no_scrollbar_behavior.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    final contact = portfolioData["contact"] as Map<String, dynamic>;
    return ScrollConfiguration(
      behavior: NoScrollbarBehavior(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '#Contact & Connect',
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(100, 255, 218, 1),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "I'm currently open to new opportunities. And would love to hear about your projects!",
              style: GoogleFonts.poppins(
                color: const Color.fromRGBO(100, 255, 218, 1),
              ),
            ),
            Divider(color: Colors.grey.shade600, thickness: 1),
            const SizedBox(height: 24),
            _buildContactCard(context, contact),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard(BuildContext context, Map<String, dynamic> contact) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildContactItem(
              context,
              icon: Icons.email,
              label: contact["email"],
              onTap: () => launchURL("mailto:${contact["email"]}"),
            ),
            Divider(color: Colors.grey.shade600, thickness: 1),
            _buildContactItem(
              context,
              icon: Icons.phone,
              label: contact["phone"],
              onTap: () => launchURL("tel:${contact["phone"]}"),
            ),
            Divider(color: Colors.grey.shade600, thickness: 1),

            _buildContactItem(
              context,
              icon: Icons.location_on,
              label: contact["location"],
            ),
            Divider(color: Colors.grey.shade600, thickness: 1),

            _buildContactItem(
              context,
              icon: Icons.calendar_today,
              label: "Born on: ${contact["dob"]}",
            ),
            Divider(color: Colors.grey.shade600, thickness: 1),

            _buildContactItem(
              context,
              icon: Icons.picture_as_pdf,
              label: 'view Resume',
              onTap: () => launchURL("${contact["resume"]}"),
            ),
            Divider(color: Colors.grey.shade600, thickness: 1),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 48,
                  width: 48,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: FlutterSocialButton(
                      mini: true,
                      buttonType: ButtonType.linkedin,
                      onTap: () =>
                          launchURL(portfolioData["contact"]["linkedin"]),
                    ),
                  ),
                ),
                const SizedBox(width: 18),
                SizedBox(
                  height: 48,
                  width: 48,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: FlutterSocialButton(
                      mini: true,
                      buttonType: ButtonType.github,
                      onTap: () =>
                          launchURL(portfolioData["contact"]["github"]),
                    ),
                  ),
                ),
                const SizedBox(width: 18),
                SizedBox(
                  height: 48,
                  width: 48,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: FlutterSocialButton(
                      iconColor: Colors.redAccent,
                      mini: true,
                      buttonType: ButtonType.email,
                      onTap: () async {
                        final Uri emailUri = Uri(
                          scheme: 'mailto',
                          path: portfolioData["contact"]["email"],
                          queryParameters: {'subject': 'Portfolio Contact'},
                        );

                        await launchUrl(
                          emailUri,
                          mode: LaunchMode.platformDefault,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 48,
                  width: 48,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: IconButton(
                      color: Colors.cyanAccent,
                      icon: const Icon(Icons.phone),
                      onPressed: () => launchURL("tel:${contact["phone"]}"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(icon, color: const Color.fromRGBO(100, 255, 218, 1)),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
