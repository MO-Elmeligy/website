import 'package:flutter/material.dart';
import '../models/skill.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = _getSkills();
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
            'Skills & Expertise',
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
          
          // Skills by Category
          ...skills.entries.map((entry) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category Title
                Text(
                  entry.key,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Skills Grid
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isMobile ? 2 : isTablet ? 3 : 3,
                    crossAxisSpacing: isMobile ? 10 : 15,
                    mainAxisSpacing: isMobile ? 10 : 15,
                    childAspectRatio: isMobile ? 2.2 : isTablet ? 2.3 : 2.5,
                  ),
                  itemCount: entry.value.length,
                  itemBuilder: (context, index) {
                    return _SkillCard(skill: entry.value[index]);
                  },
                ),
                
                const SizedBox(height: 40),
              ],
            );
          }),
        ],
      ),
    );
  }

  Map<String, List<Skill>> _getSkills() {
    return {
      'Programming Languages': [
        const Skill(name: 'Flutter', level: 0.9, category: 'Mobile'),
        const Skill(name: 'Dart', level: 0.9, category: 'Language'),
        const Skill(name: 'C++', level: 0.7, category: 'Language'),
      ],
      'Architecture & Principles': [
        const Skill(name: 'OOP', level: 0.9, category: 'Principle'),
        const Skill(name: 'SOLID', level: 0.8, category: 'Principle'),
        const Skill(name: 'Clean Architecture', level: 0.8, category: 'Architecture'),
      ],
      'Mobile & Web Development': [
        const Skill(name: 'Flutter Mobile', level: 0.9, category: 'Mobile'),
        const Skill(name: 'Flutter Web', level: 0.8, category: 'Web'),
        const Skill(name: 'Firebase', level: 0.8, category: 'Backend'),
      ],
      'IoT & Hardware': [
        const Skill(name: 'ESP32', level: 0.8, category: 'Hardware'),
        const Skill(name: 'Arduino', level: 0.7, category: 'Hardware'),
        const Skill(name: 'Bluetooth', level: 0.8, category: 'Communication'),
      ],
      'Tools & Technologies': [
        const Skill(name: 'Git/GitHub', level: 0.9, category: 'Version Control'),
        const Skill(name: 'Figma', level: 0.7, category: 'Design'),
        const Skill(name: 'Postman', level: 0.8, category: 'API Testing'),
      ],
    };
  }
}

class _SkillCard extends StatelessWidget {
  final Skill skill;

  const _SkillCard({required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Skill Name
          Text(
            skill.name,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 10),
          
          // Progress Bar
          Container(
            height: 6,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(3),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: skill.level,
              child: Container(
                decoration: BoxDecoration(
                  color: _getSkillColor(skill.level),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 5),
          
          // Skill Level
          Text(
            '${(skill.level * 100).toInt()}%',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Color _getSkillColor(double level) {
    if (level >= 0.8) return Colors.green;
    if (level >= 0.6) return Colors.orange;
    return Colors.red;
  }
}
