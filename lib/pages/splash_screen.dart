import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_icon/gradient_icon.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 338),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/news logo.png',
                height: 128,
              ),
              SizedBox(height: 30,),
              GradientText(
                "News Hive",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1A1A1A),
                ),
                gradientType: GradientType.linear,
                colors: [
                  Color(0xffA9B5DF),
                  Color(0xff2D336B),
                ],
              ),
              SizedBox(
                height: 250,
              ),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff2D336B)),
              ),
              // GradientIcon(icon: Icons.circle, gradient: gradient)
            ],
          ),
        ),
      ),
    );
  }
}