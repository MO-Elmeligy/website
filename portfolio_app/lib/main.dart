import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const SakuraLandingApp());
}

class SakuraLandingApp extends StatelessWidget {
  const SakuraLandingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sakura Portfolio',
      theme: ThemeData.dark(),
      home: const SakuraHomePage(),
    );
  }
}

class SakuraHomePage extends StatefulWidget {
  const SakuraHomePage({super.key});

  @override
  State<SakuraHomePage> createState() => _SakuraHomePageState();
}

class _SakuraHomePageState extends State<SakuraHomePage> {
  late VideoPlayerController _videoController;
  bool useMirin = true; // Toggle between Mirin (local) and Vecteezy (network)

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() {
    if (useMirin) {
      _videoController = VideoPlayerController.asset(
        'lib/assets/videos/sakura01.mp4/sakura01.mp4',
      );
    } else {
      _videoController = VideoPlayerController.network(
        'https://cdn.vecteezy.com/system/resources/previews/004/579/489/mp4/anime-style-japanese-sakura-background-loop-free-video.mp4',
      );
    }

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
    super.dispose();
  }

  void _toggleBackground() {
    setState(() {
      _videoController.pause();
      _videoController.dispose();
      useMirin = !useMirin;
      _initializeVideo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleBackground,
        tooltip: 'Toggle Background',
        child: const Icon(Icons.switch_video),
      ),
      body: Stack(
        children: [
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
          const Center(child: LandingSection()),
        ],
      ),
    );
  }
}

class LandingSection extends StatelessWidget {
  const LandingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Hi, I\'m Mohamed Elmeligy',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Flutter Developer | Anime Inspired UI Lover',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {},
            child: const Text('View My Work'),
          ),
        ],
      ),
    );
  }
}
