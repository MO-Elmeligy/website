import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : isTablet ? 24 : 32, 
        vertical: isMobile ? 60 : 80
      ),
      child: Column(
        children: [
          // Section Title
          Text(
            'Get In Touch',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 32 : isTablet ? 36 : 42,
            ),
            textAlign: TextAlign.center,
          ),
          
          SizedBox(height: isMobile ? 15 : 20),
          
          Container(
            width: isMobile ? 80 : 100,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          
          SizedBox(height: isMobile ? 40 : 60),
          
          // Contact Content
          isMobile 
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Contact Info
                  Text(
                    'Let\'s Work Together',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? 24 : 28,
                    ),
                  ),
                  
                  SizedBox(height: isMobile ? 15 : 20),
                  
                  Text(
                    'I\'m always interested in new opportunities and exciting projects. '
                    'Whether you have a question, want to collaborate, or just want to say hi, '
                    'I\'ll try my best to get back to you!',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white70,
                      fontSize: isMobile ? 14 : 16,
                      height: 1.6,
                    ),
                  ),
                  
                  SizedBox(height: isMobile ? 30 : 40),
                  
                  // Contact Methods
                  _ContactMethod(
                    icon: Icons.email,
                    title: 'Email',
                    subtitle: 'wasdmagneto17@gmail.com',
                    onTap: () => _openEmail(),
                  ),
                  
                  SizedBox(height: isMobile ? 15 : 20),
                  
                  _ContactMethod(
                    icon: Icons.code,
                    title: 'GitHub',
                    subtitle: 'github.com/MO-Elmeligy',
                    onTap: () => _openGitHub(),
                  ),
                  
                  SizedBox(height: isMobile ? 15 : 20),
                  
                  _ContactMethod(
                    icon: Icons.work,
                    title: 'LinkedIn',
                    subtitle: 'Mohamed Elmeligy',
                    onTap: () => _openLinkedIn(),
                  ),
                  
                  SizedBox(height: isMobile ? 30 : 40),
                  
                  // Contact Form for Mobile
                  Container(
                    padding: EdgeInsets.all(isMobile ? 20 : 30),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white.withOpacity(0.2)),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Text(
                            'Send Message',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          
                          SizedBox(height: isMobile ? 20 : 30),
                          
                          // Name Field
                          TextFormField(
                            controller: _nameController,
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          
                          SizedBox(height: isMobile ? 15 : 20),
                          
                          // Email Field
                          TextFormField(
                            controller: _emailController,
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!value.contains('@')) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          
                          SizedBox(height: isMobile ? 15 : 20),
                          
                          // Message Field
                          TextFormField(
                            controller: _messageController,
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your message';
                              }
                              return null;
                            },
                          ),
                          
                          SizedBox(height: isMobile ? 20 : 30),
                          
                          // Send Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _sendMessage,
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
              )
            : Row(
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
                          onTap: () => _openEmail(),
                        ),
                        
                        const SizedBox(height: 20),
                        
                        _ContactMethod(
                          icon: Icons.code,
                          title: 'GitHub',
                          subtitle: 'github.com/MO-Elmeligy',
                          onTap: () => _openGitHub(),
                        ),
                        
                        const SizedBox(height: 20),
                        
                        _ContactMethod(
                          icon: Icons.work,
                          title: 'LinkedIn',
                          subtitle: 'Mohamed Elmeligy',
                          onTap: () => _openLinkedIn(),
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
                      child: Form(
                        key: _formKey,
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
                            TextFormField(
                              controller: _nameController,
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                            
                            const SizedBox(height: 20),
                            
                            // Email Field
                            TextFormField(
                              controller: _emailController,
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!value.contains('@')) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            
                            const SizedBox(height: 20),
                            
                            // Message Field
                            TextFormField(
                              controller: _messageController,
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your message';
                                }
                                return null;
                              },
                            ),
                            
                            const SizedBox(height: 30),
                            
                            // Send Button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: _sendMessage,
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
                  ),
                ],
              ),
          
          SizedBox(height: isMobile ? 40 : 60),
          
          // Footer
          Container(
            padding: EdgeInsets.symmetric(vertical: isMobile ? 15 : 20),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.white.withOpacity(0.2)),
              ),
            ),
            child: isMobile 
              ? Column(
                  children: [
                    Text(
                      '© 2024 Mohamed Elmeligy. All rights reserved.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white60,
                        fontSize: isMobile ? 12 : 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                    SizedBox(height: isMobile ? 15 : 20),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _SocialIcon(Icons.code),
                        SizedBox(width: isMobile ? 15 : 15),
                        _SocialIcon(Icons.work),
                        SizedBox(width: isMobile ? 15 : 15),
                        _SocialIcon(Icons.email),
                      ],
                    ),
                  ],
                )
              : Row(
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

  Future<void> _openEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'wasdmagneto17@gmail.com',
      query: 'subject=Portfolio Inquiry&body=Hello Mohamed, I would like to discuss...',
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  Future<void> _openGitHub() async {
    final Uri url = Uri.parse('https://github.com/MO-Elmeligy');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _openLinkedIn() async {
    final Uri url = Uri.parse('https://www.linkedin.com/in/mohamed-elmeligy-574b06260');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  void _sendMessage() {
    if (_formKey.currentState!.validate()) {
      // Create email URI with form data
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: 'wasdmagneto17@gmail.com',
        query: 'subject=New Message from ${_nameController.text}&body=Name: ${_nameController.text}%0D%0AEmail: ${_emailController.text}%0D%0A%0D%0AMessage:%0D%0A${_messageController.text}',
      );
      
      // Launch email client
      launchUrl(emailUri).then((_) {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email client opened! Please send your message.'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
          ),
        );
        
        // Clear form
        _nameController.clear();
        _emailController.clear();
        _messageController.clear();
      }).catchError((error) {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not open email client. Please try again.'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      });
    }
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
