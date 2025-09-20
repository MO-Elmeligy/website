import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: Column(
        children: [
          // Section Title
          Text(
            'About Me',
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
          
          // Content
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text Content
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Passionate Flutter Developer',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    Text(
                      'I am a passionate Flutter developer with expertise in creating beautiful, '
                      'responsive mobile and web applications. With a strong foundation in Dart '
                      'programming and modern software architecture principles, I specialize in '
                      'building scalable applications that deliver exceptional user experiences.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white70,
                        fontSize: 16,
                        height: 1.6,
                      ),
                    ),
                    
                    const SizedBox(height: 30),
                    
                    Text(
                      'My journey in mobile development has led me to work on diverse projects '
                      'ranging from entertainment apps to IoT solutions. I believe in clean code, '
                      'SOLID principles, and creating applications that not only meet requirements '
                      'but exceed expectations.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white70,
                        fontSize: 16,
                        height: 1.6,
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Key Points
                    _KeyPoint(
                      icon: Icons.mobile_friendly,
                      title: 'Mobile & Web Development',
                      description: 'Flutter applications for iOS, Android, and Web platforms',
                    ),
                    
                    const SizedBox(height: 20),
                    
                    _KeyPoint(
                      icon: Icons.architecture,
                      title: 'Clean Architecture',
                      description: 'SOLID principles and maintainable code structure',
                    ),
                    
                    const SizedBox(height: 20),
                    
                    _KeyPoint(
                      icon: Icons.smart_toy,
                      title: 'IoT Integration',
                      description: 'ESP32, Arduino, and Bluetooth connectivity solutions',
                    ),
                  ],
                ),
              ),
              
              const SizedBox(width: 60),
              
              // Stats/Highlights
              Expanded(
                child: Column(
                  children: [
                    _StatCard(
                      number: '4+',
                      label: 'Projects Completed',
                      icon: Icons.work_outline,
                    ),
                    
                    const SizedBox(height: 20),
                    
                    _StatCard(
                      number: '2+',
                      label: 'Years Experience',
                      icon: Icons.trending_up,
                    ),
                    
                    const SizedBox(height: 20),
                    
                    _StatCard(
                      number: '100%',
                      label: 'Client Satisfaction',
                      icon: Icons.star,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _KeyPoint extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _KeyPoint({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
                description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String number;
  final String label;
  final IconData icon;

  const _StatCard({
    required this.number,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.pinkAccent,
            size: 30,
          ),
          
          const SizedBox(height: 10),
          
          Text(
            number,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          
          const SizedBox(height: 5),
          
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
