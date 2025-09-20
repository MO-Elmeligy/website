import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  final ScrollController? scrollController;
  
  const HeroSection({super.key, this.scrollController});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;
    
    return Container(
      height: screenHeight,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : isTablet ? 32 : 48,
        vertical: isMobile ? 20 : 40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Profile Image
          Container(
            width: isMobile ? 150 : isTablet ? 180 : 200,
            height: isMobile ? 150 : isTablet ? 180 : 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
              child: ClipOval(
              child: Image.asset(
                'assets/images/mohamed_profile.jpg',
                width: isMobile ? 150 : isTablet ? 180 : 200,
                height: isMobile ? 150 : isTablet ? 180 : 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const CircleAvatar(
                    backgroundColor: Colors.white24,
                    child: Icon(
                      Icons.person,
                      size: 100,
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ),
          ),
          
          SizedBox(height: isMobile ? 30 : 40),
          
          // Name
          Text(
            'Mohamed Elmeligy',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: isMobile ? 32 : isTablet ? 40 : 48,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 10,
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          
          SizedBox(height: isMobile ? 15 : 20),
          
          // Title
          Text(
            'Flutter Developer',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white70,
              fontSize: isMobile ? 18 : isTablet ? 20 : 24,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
          
          SizedBox(height: isMobile ? 8 : 10),
          
          // Subtitle
          Text(
            isMobile 
              ? 'Mobile & Web Development\nIoT Integration • Clean Architecture'
              : 'Mobile & Web Development • IoT Integration • Clean Architecture',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white60,
              fontSize: isMobile ? 14 : isTablet ? 15 : 16,
            ),
            textAlign: TextAlign.center,
          ),
          
          SizedBox(height: isMobile ? 30 : 50),
          
          // CTA Buttons
          isMobile 
            ? Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _scrollToSection(2); // Projects section
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'View My Work',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 15),
                  
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        _scrollToSection(4); // Contact section
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white, width: 2),
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Get In Touch',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _scrollToSection(2); // Projects section
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'View My Work',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  
                  const SizedBox(width: 20),
                  
                  OutlinedButton(
                    onPressed: () {
                      _scrollToSection(4); // Contact section
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white, width: 2),
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Get In Touch',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
          
          SizedBox(height: isMobile ? 20 : 30),
          
          // Social Links
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialButton(
                icon: Icons.code,
                onTap: () {
                  _openGitHub();
                },
              ),
              const SizedBox(width: 20),
              _SocialButton(
                icon: Icons.work,
                onTap: () {
                  _openLinkedIn();
                },
              ),
              const SizedBox(width: 20),
              _SocialButton(
                icon: Icons.email,
                onTap: () {
                  _openEmail();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _scrollToSection(int index) {
    if (scrollController != null) {
      final sections = [
        0.0, // Hero
        800.0, // About
        1600.0, // Projects
        2400.0, // Skills
        3200.0, // Contact
      ];

      if (index < sections.length) {
        scrollController!.animateTo(
          sections[index],
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  void _openGitHub() async {
    final Uri url = Uri.parse('https://github.com/MO-Elmeligy');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  void _openLinkedIn() async {
    final Uri url = Uri.parse('https://www.linkedin.com/in/mohamed-elmeligy-574b06260');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  void _openEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'wasdmagneto17@gmail.com',
      query: 'subject=Portfolio Inquiry&body=Hello Mohamed, I would like to discuss...',
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SocialButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.3)),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}
