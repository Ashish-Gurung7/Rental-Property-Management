import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_models/property_view_model.dart';
import 'view_models/tenant_view_model.dart';
import 'view_models/payment_view_model.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PropertyViewModel()),
        ChangeNotifierProvider(create: (_) => TenantViewModel()),
        ChangeNotifierProvider(create: (_) => PaymentViewModel()),
      ],
      child: const PropertyManagerApp(),
    ),
  );
}

class PropertyManagerApp extends StatelessWidget {
  const PropertyManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Property Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF1D5CFF),
        scaffoldBackgroundColor: const Color(0xFFF7F8FA),
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1D5CFF),
          elevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFF1D5CFF),
          unselectedItemColor: Color(0xFF7B8190),
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(fontSize: 12),
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Color(0xFFEBF0F5), width: 1),
          ),
          margin: EdgeInsets.zero,
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(color: Color(0xFF1A1D27), fontSize: 28, fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(color: Color(0xFF1A1D27), fontSize: 24, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(color: Color(0xFF1A1D27), fontSize: 20, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(color: Color(0xFF1A1D27), fontSize: 16, fontWeight: FontWeight.w600),
          titleSmall: TextStyle(color: Color(0xFF1A1D27), fontSize: 14, fontWeight: FontWeight.w600),
          bodyLarge: TextStyle(color: Color(0xFF1A1D27), fontSize: 16),
          bodyMedium: TextStyle(color: Color(0xFF7B8190), fontSize: 14),
          bodySmall: TextStyle(color: Color(0xFF7B8190), fontSize: 12),
        ),
      ),
      home: const MainScreen(),
    );
  }
}
