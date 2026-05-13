import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Premium',
      debugShowCheckedModeBanner: false,

      // Tema global aplikasi
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF533483),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),

      // LoginScreen sebagai halaman pertama
      home: const LoginScreen(),
    );
  }
}