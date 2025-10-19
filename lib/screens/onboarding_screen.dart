// screens/onboarding_screen.dart
import 'package:flutter/material.dart';
import 'auth_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _onboardingPages = [
    OnboardingPage(
      title: 'Welcome to Excerlate',
      description: 'Start your learning journey with our comprehensive courses and programs designed for your growth.',
      image: Icons.school,
      color: Colors.purple,
    ),
    OnboardingPage(
      title: 'Featured Programs',
      description: 'Discover curated programs that match your interests and career goals.',
      image: Icons.featured_play_list,
      color: Colors.pink,
    ),
    OnboardingPage(
      title: 'Track Progress',
      description: 'Monitor your learning journey with detailed analytics and achievement tracking.',
      image: Icons.analytics,
      color: Colors.deepPurple,
    ),
    OnboardingPage(
      title: 'Learn Anywhere',
      description: 'Access your courses anytime, anywhere with our mobile-friendly platform.',
      image: Icons.mobile_friendly,
      color: Colors.purple,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Skip Button (Top Right)
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 16, right: 16),
              child: TextButton(
                onPressed: () {
                  _completeOnboarding();
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _onboardingPages.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingPageWidget(page: _onboardingPages[index]);
              },
            ),
          ),
          
          // Bottom Section
          Container(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                // Page Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                SizedBox(height: 32),
                
                // Continue Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentPage == _onboardingPages.length - 1) {
                        _completeOnboarding();
                      } else {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _onboardingPages[_currentPage].color,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                    ),
                    child: Text(
                      _currentPage == _onboardingPages.length - 1 
                          ? 'Get Started' 
                          : 'Continue',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < _onboardingPages.length; i++) {
      indicators.add(
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: _currentPage == i ? 24 : 8,
          height: 8,
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: _currentPage == i ? _onboardingPages[i].color : Colors.grey[300],
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      );
    }
    return indicators;
  }

  void _completeOnboarding() {
    // Save onboarding completion status (you can use SharedPreferences)
    // SharedPreferences.getInstance().then((prefs) {
    //   prefs.setBool('hasSeenOnboarding', true);
    // });
    
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AuthScreen()),
    );
  }
}

class OnboardingPage {
  final String title;
  final String description;
  final IconData image;
  final Color color;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.image,
    required this.color,
  });
}

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingPage page;

  const OnboardingPageWidget({required this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animated Icon Container
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [page.color, _getSecondaryColor(page.color)],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: page.color.withOpacity(0.3),
                  blurRadius: 15,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: Icon(
              page.image,
              size: 80,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 48),
          
          // Title
          Text(
            page.title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          
          // Description
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              page.description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Color _getSecondaryColor(Color primaryColor) {
    if (primaryColor == Colors.purple) return Colors.pink;
    if (primaryColor == Colors.pink) return Colors.purple;
    if (primaryColor == Colors.deepPurple) return Colors.purple;
    return Colors.pink;
  }
}