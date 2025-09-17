import 'package:bording_week1/views/mainscreen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // async main use cheyyan required
  try {
    final response = await http.get(
      Uri.parse(
        "https://raw.githubusercontent.com/sayanp23/test-api/main/test-notifications.json",
      ),
    );
    print(response.body);
  } catch (e) {
    print("Network error: $e");
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      theme: ThemeData(
        fontFamily: "Quicksand",
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
      ),
    );
  }
}
