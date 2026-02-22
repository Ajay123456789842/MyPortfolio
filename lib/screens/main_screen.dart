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
            children: const [
              TextSpan(
                text: 'Naga Ajay',
                style: TextStyle(color: Color.fromRGBO(100, 255, 218, 1)),
              ),
              const TextSpan(
                text: ' Bathula',
                style: TextStyle(color: Color.fromRGBO(100, 255, 218, 1)),
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
                      child: Wrap(
                        spacing: 4,
                        runSpacing: 8,
                        children: [
                          Chip(
                            backgroundColor: Color.fromRGBO(8, 32, 50, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            side: const BorderSide(
                              color: Color.fromRGBO(100, 255, 218, 1),
                            ),
                            label: Text(
                              _pageTitles[index],
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: _selectedIndex == index
                                    ? Colors.white
                                    : const Color.fromRGBO(100, 255, 218, 1),
                                fontWeight: _selectedIndex == index
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
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
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(key: homeKey, child: const HomePage()),
                Container(key: aboutKey, child: const AboutPage()),
                Container(key: projectsKey, child: const ProjectsPage()),
                Container(key: contactKey, child: const ContactPage()),
                const Padding(
                  padding: EdgeInsets.only(bottom: 24),
                  child: Center(
                    child: Text('Designed and Built with flutter ❤️'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: isMobile
          ? NavigationBar(
              labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>((
                states,
              ) {
                if (states.contains(MaterialState.selected)) {
                  return const TextStyle(color: Color(0xFF64FFDA));
                }
                return const TextStyle(color: Colors.white);
              }),
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) {
                if (index == 0) scrollToSection(homeKey, 0);
                if (index == 1) scrollToSection(aboutKey, 1);
                if (index == 2) scrollToSection(projectsKey, 2);
                if (index == 3) scrollToSection(contactKey, 3);
              },
              height: 70,
              backgroundColor: const Color.fromRGBO(8, 32, 50, 1),
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              destinations: [
                NavigationDestination(
                  icon: const Icon(
                    Icons.person_outline,
                    color: Color.fromRGBO(100, 255, 218, 1),
                  ),
                  selectedIcon: Icon(Icons.person, color: Colors.grey.shade600),
                  label: 'About',
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.work_outline,
                    color: Color.fromRGBO(100, 255, 218, 1),
                  ),
                  selectedIcon: Icon(Icons.work, color: Colors.grey.shade600),
                  label: 'Skills',
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.folder_open,
                    color: Color.fromRGBO(100, 255, 218, 1),
                  ),
                  selectedIcon: Icon(Icons.folder, color: Colors.grey.shade600),
                  label: 'Projects',
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.contact_mail_outlined,
                    color: Color.fromRGBO(100, 255, 218, 1),
                  ),
                  selectedIcon: Icon(
                    Icons.contact_mail,
                    color: Colors.grey.shade600,
                  ),
                  label: 'Contact',
                ),
              ],
            )
          : null,
    );
  }
}
