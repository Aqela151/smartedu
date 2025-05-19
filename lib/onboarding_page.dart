import 'package:flutter/material.dart';
import 'app/routes/app_routes.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingContent> _contents = [
    OnboardingContent(
      title: "Belajar Kapan Saja",
      image: Icons.access_time,
      description: "Akses materi pembelajaran kapanpun dan dimanapun sesuai kebutuhanmu",
    ),
    OnboardingContent(
      title: "Materi Interaktif",
      image: Icons.menu_book,
      description: "Nikmati pembelajaran dengan konten yang interaktif dan menarik",
    ),
    OnboardingContent(
      title: "Kembangkan Potensimu",
      image: Icons.trending_up,
      description: "Tingkatkan prestasi dan kembangkan minat bakatmu bersama kami",
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _contents.length,
                itemBuilder: (context, index) {
                  return _buildPage(_contents[index], screenWidth, screenHeight);
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _contents.length,
                      (index) => _buildDot(index),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_currentPage == _contents.length - 1) {
                            Navigator.pushReplacementNamed(context, AppRoutes.signIn);
                          } else {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF86A3BE),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.022),
                          elevation: 3,
                        ),
                        child: Text(
                          _currentPage == _contents.length - 1 ? "Continue" : "Next",
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05), // jarak bawah diperbesar
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(OnboardingContent content, double width, double height) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: height * 0.7),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.08), // jarak atas
              Container(
                width: width * 0.5,
                height: width * 0.5,
                decoration: BoxDecoration(
                  color: const Color(0xFF86A3BE).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  content.image,
                  size: width * 0.25,
                  color: const Color(0xFF86A3BE),
                ),
              ),
              SizedBox(height: height * 0.06), // jarak ikon ke title
              Text(
                content.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: width * 0.06,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF86A3BE),
                ),
              ),
              SizedBox(height: height * 0.035), // jarak title ke deskripsi
              Text(
                content.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: width * 0.042,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: height * 0.04), // jarak bawah
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 8),
      height: 8,
      width: _currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index
            ? const Color(0xFF86A3BE)
            : const Color(0xFF86A3BE).withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

class OnboardingContent {
  final String title;
  final IconData image;
  final String description;

  OnboardingContent({
    required this.title,
    required this.image,
    required this.description,
  });
}
