import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/main_screen.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ajay Bathula',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(8, 32, 50, 1),
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromRGBO(8, 32, 50, 1),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.poppins(color: Colors.white),
          bodyMedium: GoogleFonts.poppins(color: Colors.grey.shade600),
          titleLarge: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          displayLarge: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          headlineLarge: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        cardTheme: CardThemeData(
          color: const Color.fromRGBO(17, 34, 64, 1),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF1434A4),
          secondary: Color(0xFFF0F2F5),
          surface: Colors.white,
          onSurface: Colors.black87,
        ),
        navigationBarTheme: NavigationBarThemeData(
          iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
            if (states.contains(MaterialState.selected)) {
              return const IconThemeData(
                color: Color.fromRGBO(100, 255, 218, 1),
              );
            }
            return IconThemeData(color: Colors.grey.shade600);
          }),
          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>((
            states,
          ) {
            return TextStyle(
              color: states.contains(MaterialState.selected)
                  ? Color(0xFF1434A4)
                  : Colors.grey.shade600,
            );
          }),
        ),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
