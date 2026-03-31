import 'package:flutter/material.dart';
import 'page2.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),

              // 🔥 Gradient Heading - Cleaner version
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [
                    Color(0xFF4FACFE),
                    Color(0xFFB465DA),
                    Color(0xFFFF8C42),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: const Text(
                  "Attendance\nat Your\nFingertips",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    height: 1.2,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const SizedBox(height: 40),

              // 🖼 Illustration - Make sure to add the asset
              Center(
                child: Image.asset(
                  'assets/Finger_drawing.png',
                  height: 280,
                  fit: BoxFit.contain,
                ),
              ),
              Column(
                // mainAxisAlignment: ma,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildDot(true),
                      const SizedBox(width: 8),
                      _buildDot(false),
                      const SizedBox(width: 8),
                      _buildDot(false),
                    ],
                  ),
                ],
              ),
              const Spacer(),

              // 🔻 Bottom Section
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // 🔘 Page Indicators

                    // 🚀 Next Button with Gradient Border Effect
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Page2(),
                          ),
                        );
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF4FACFE),
                              Color(0xFFB465DA),
                              Color(0xFFFF8C42),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔘 Dot Widget with animation support
  Widget _buildDot(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: isActive ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF4FACFE) : Colors.grey[400],
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
