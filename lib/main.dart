import 'package:flutter/material.dart';
import 'package:food_app/Screens/Payment.dart' ;
import 'package:food_app/Screens/home_screen.dart';
import 'package:food_app/Screens/Editable_order.dart';
import 'package:food_app/Screens/products.dart';
import 'package:food_app/routes/routes.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.home: (context) => HomeScreen(),
        AppRoutes.splash: (context) => SplashPage(),
        AppRoutes.products: (context) => Product(),
        AppRoutes.EditableOrder: (context) => EditableOrder(),
        AppRoutes.Payment: (context) => Payment(),
      },
      initialRoute: AppRoutes.splash,
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFF939B), Color(0xFFEF2A39)],
          ),
        ),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset("assets/Foodgo.png"),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: Image.asset("assets/splash.png"),
            ),
          ],
        ),
      ),
    );
  }
}
