import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 2;
              });
            },
            children: [
              IntroPage(
                image: 'assets/images/intro1.png',
                title: 'The World at Your Fingertips',
                description: 'Get 24/7 updates on global news – from breaking politics to cultural trends, all in one place',
              ),
              IntroPage(
                image: 'assets/images/intro2.png',
                title: 'Tailored to Your Curiosity',
                description: 'Select your interests and receive handpicked stories. Technology, sports, or entertainment – we\'ve got you covered',
              ),
              IntroPage(
                image: 'assets/images/intro3.png',
                title: 'Trusted Updates in Real-Time',
                description: 'Instant alerts for breaking news, rigorously fact-checked by our editors before they reach you',
              ),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    // Navigate to home screen
                  },
                  child: Text(
                    'Skip',
                    style: GoogleFonts.poppins(
                      color: const Color(0xff2D336B),
                      fontSize: 16,
                    ),
                  ),
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const WormEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Color(0xff2D336B),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (isLastPage) {
                      // Navigate to home screen
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: Text(
                    isLastPage ? 'Done' : 'Next',
                    style: GoogleFonts.poppins(
                      color: const Color(0xff2D336B),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IntroPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const IntroPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 300,
          ),
          const SizedBox(height: 64),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xff2D336B),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}