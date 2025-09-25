import 'package:bording_week1/views/mainscreen/main_screen.dart';
import 'package:bording_week1/views/otherscreen/notifications_screen.dart';
import 'package:flutter/material.dart';

/// Entry point of the application
void main() async {
  // Ensures Flutter engine is initialized for async operations
  WidgetsFlutterBinding.ensureInitialized();

  // Run the app
  runApp(const MyApp());
}

/// Root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug banner
      title: 'Bording App', // App title
      // Initial route when app starts
      initialRoute: '/',

      // Define app routes
      routes: {
        '/': (context) => MainScreen(), // Home/Main screen
        '/notifications':
            (context) => const NotificationsScreen(), // Notifications screen
      },

      // Theme customization
      theme: ThemeData(
        fontFamily: "Quicksand", // Set default font
        scaffoldBackgroundColor:
            Colors.white, // Background color for all screens
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white, // AppBar background color
          elevation: 0, // Remove AppBar shadow
          iconTheme: IconThemeData(color: Colors.black), // Icon color in AppBar
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
