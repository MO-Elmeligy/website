import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Profile Image Placeholder
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const CircleAvatar(
              backgroundColor: Colors.white24,
              child: Icon(
                Icons.person,
                size: 100,
                color: Colors.white,
              ),
            ),
          ),
          
          const SizedBox(height: 40),
          
          // Name
          Text(
            'Mohamed Elmeligy',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 48,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 10,
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 20),
          
          // Title
          Text(
            'Flutter Developer',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white70,
              fontSize: 24,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 10),
          
          // Subtitle
          Text(
            'Mobile & Web Development • IoT Integration • Clean Architecture',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white60,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 50),
          
          // CTA Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Scroll to projects section
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
                  // Scroll to contact section
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
          
          const SizedBox(height: 30),
          
          // Social Links
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialButton(
                icon: Icons.code,
                onTap: () {
                  // Open GitHub
                },
              ),
              const SizedBox(width: 20),
              _SocialButton(
                icon: Icons.work,
                onTap: () {
                  // Open LinkedIn
                },
              ),
              const SizedBox(width: 20),
              _SocialButton(
                icon: Icons.email,
                onTap: () {
                  // Open Email
                },
              ),
            ],
          ),
        ],
      ),
    );
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
