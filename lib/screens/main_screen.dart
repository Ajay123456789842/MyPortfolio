import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/screens/about_page.dart';
import 'package:my_portfolio/screens/contact_page.dart';
import 'package:my_portfolio/screens/home_page.dart';
import 'package:my_portfolio/screens/projects_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ScrollController _scrollController = ScrollController();

  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  int _selectedIndex = 0;

  final List<String> _pageTitles = const [
    'About',
    'Skills&work exp',
    'Projects',
    'Contact',
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    double offset = _scrollController.offset;

    double homeHeight = homeKey.currentContext?.size?.height ?? 0;
    double aboutHeight = aboutKey.currentContext?.size?.height ?? 0;
    double projectsHeight = projectsKey.currentContext?.size?.height ?? 0;

    if (offset < homeHeight - 100) {
      setState(() => _selectedIndex = 0);
    } else if (offset < homeHeight + aboutHeight - 100) {
      setState(() => _selectedIndex = 1);
    } else if (offset < homeHeight + aboutHeight + projectsHeight - 100) {
      setState(() => _selectedIndex = 2);
    } else {
      setState(() => _selectedIndex = 3);
    }
  }

  void scrollToSection(GlobalKey key, int index) {
    setState(() => _selectedIndex = index);

    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    const double mobileBreakpoint = 600;
    final bool isMobile = MediaQuery.of(context).size.width < mobileBreakpoint;

    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: 'Naga Ajay',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const TextSpan(
                text: ' Bathula',
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
        actions: isMobile
            ? null
            : [
                const SizedBox(width: 16),
                ...List.generate(
                  _pageTitles.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextButton(
                      onPressed: () {
                        if (index == 0) scrollToSection(homeKey, 0);
                        if (index == 1) scrollToSection(aboutKey, 1);
                        if (index == 2) scrollToSection(projectsKey, 2);
                        if (index == 3) scrollToSection(contactKey, 3);
                      },
                      child: Wrap(spacing: 4, runSpacing: 8, children: [
                        Chip(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          label: Text(
                            _pageTitles[index],
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: _selectedIndex == index
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.black54,
                              fontWeight: _selectedIndex == index
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
              ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: isMobile ? double.infinity : 900,
          ),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Container(key: homeKey, child: const HomePage()),
                Container(key: aboutKey, child: const AboutPage()),
                Container(key: projectsKey, child: const ProjectsPage()),
                Container(key: contactKey, child: const ContactPage()),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: isMobile
          ? NavigationBar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) {
                if (index == 0) scrollToSection(homeKey, 0);
                if (index == 1) scrollToSection(aboutKey, 1);
                if (index == 2) scrollToSection(projectsKey, 2);
                if (index == 3) scrollToSection(contactKey, 3);
              },
              height: 70,
              backgroundColor: Colors.white,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.person_outline),
                  selectedIcon: Icon(Icons.person),
                  label: 'About',
                ),
                NavigationDestination(
                  icon: Icon(Icons.work_outline),
                  selectedIcon: Icon(Icons.work),
                  label: 'Skills&work exp',
                ),
                NavigationDestination(
                  icon: Icon(Icons.folder_open),
                  selectedIcon: Icon(Icons.folder),
                  label: 'Projects',
                ),
                NavigationDestination(
                  icon: Icon(Icons.contact_mail_outlined),
                  selectedIcon: Icon(Icons.contact_mail),
                  label: 'Contact',
                ),
              ],
            )
          : null,
    );
  }
}
