import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/contact_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _videoController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() {
    _videoController = VideoPlayerController.asset(
      'lib/assets/videos/sakura01.mp4/sakura01.mp4',
    );

    _videoController
      ..setLooping(true)
      ..setVolume(0)
      ..initialize().then((_) {
        setState(() {});
        _videoController.play();
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Video Background
          if (_videoController.value.isInitialized)
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _videoController.value.size.width,
                  height: _videoController.value.size.height,
                  child: VideoPlayer(_videoController),
                ),
              ),
            )
          else
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          
          // Content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const HeroSection(),
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
