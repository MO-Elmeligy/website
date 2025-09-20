import 'package:flutter/material.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: Column(
        children: [
          // Section Title
          Text(
            'Get In Touch',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 42,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 20),
          
          Container(
            width: 100,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          
          const SizedBox(height: 60),
          
          // Contact Content
          Row(
            children: [
              // Contact Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Let\'s Work Together',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    Text(
                      'I\'m always interested in new opportunities and exciting projects. '
                      'Whether you have a question, want to collaborate, or just want to say hi, '
                      'I\'ll try my best to get back to you!',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white70,
                        fontSize: 16,
                        height: 1.6,
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Contact Methods
                    _ContactMethod(
                      icon: Icons.email,
                      title: 'Email',
                      subtitle: 'wasdmagneto17@gmail.com',
                      onTap: () {
                        // Open email client
                      },
                    ),
                    
                    const SizedBox(height: 20),
                    
                    _ContactMethod(
                      icon: Icons.code,
                      title: 'GitHub',
                      subtitle: 'github.com/MO-Elmeligy',
                      onTap: () {
                        // Open GitHub
                      },
                    ),
                    
                    const SizedBox(height: 20),
                    
                    _ContactMethod(
                      icon: Icons.work,
                      title: 'LinkedIn',
                      subtitle: 'Mohamed Elmeligy',
                      onTap: () {
                        // Open LinkedIn
                      },
                    ),
                  ],
                ),
              ),
              
              const SizedBox(width: 60),
              
              // Contact Form
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Send Message',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                      const SizedBox(height: 30),
                      
                      // Name Field
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: const TextStyle(color: Colors.white70),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.white30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.pinkAccent),
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Email Field
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: const TextStyle(color: Colors.white70),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.white30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.pinkAccent),
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Message Field
                      TextField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          labelText: 'Message',
                          labelStyle: const TextStyle(color: Colors.white70),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.white30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.pinkAccent),
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                      
                      const SizedBox(height: 30),
                      
                      // Send Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Send message
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Send Message',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 60),
          
          // Footer
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.white.withOpacity(0.2)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '© 2024 Mohamed Elmeligy. All rights reserved.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white60,
                  ),
                ),
                
                Row(
                  children: [
                    _SocialIcon(Icons.code),
                    const SizedBox(width: 15),
                    _SocialIcon(Icons.work),
                    const SizedBox(width: 15),
                    _SocialIcon(Icons.email),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactMethod extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ContactMethod({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.pinkAccent.withOpacity(0.2),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Icon(
              icon,
              color: Colors.pinkAccent,
              size: 24,
            ),
          ),
          
          const SizedBox(width: 20),
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white70,
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

class _SocialIcon extends StatelessWidget {
  final IconData icon;

  const _SocialIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle social link
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.3)),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
