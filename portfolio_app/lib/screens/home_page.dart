import 'package:flutter/material.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/professional_background.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Professional Background
          const ProfessionalBackground(),
          
          // Content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeroSection(scrollController: _scrollController),
                const AboutSection(),
                const ProjectsSection(),
                const SkillsSection(),
                const ContactSection(),
              ],
            ),
          ),
          
          // Navigation Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomNavigationBar(scrollController: _scrollController),
          ),
        ],
      ),
    );
  }
}
