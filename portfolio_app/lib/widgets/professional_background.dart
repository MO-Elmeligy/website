import 'package:flutter/material.dart';
import 'dart:math' as math;

class ProfessionalBackground extends StatefulWidget {
  const ProfessionalBackground({super.key});

  @override
  State<ProfessionalBackground> createState() => _ProfessionalBackgroundState();
}

class _ProfessionalBackgroundState extends State<ProfessionalBackground>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF0F0F23), // Dark navy
                Color(0xFF1A1A2E), // Darker navy
                Color(0xFF16213E), // Blue-gray
                Color(0xFF0F3460), // Dark blue
                Color(0xFF533483), // Purple
                Color(0xFFE94560), // Pink accent
              ],
              stops: [0.0, 0.2, 0.4, 0.6, 0.8, 1.0],
            ),
          ),
          child: Stack(
            children: [
              // Animated geometric shapes
              ..._buildAnimatedShapes(),
              
              // Floating particles
              ..._buildFloatingParticles(),
              
              // Gradient overlay for depth
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.3),
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.5),
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildAnimatedShapes() {
    return [
      // Large floating circle
      Positioned(
        top: 100 + 50 * math.sin(_animation.value * 2 * math.pi),
        right: 50 + 30 * math.cos(_animation.value * 2 * math.pi),
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                Colors.pinkAccent.withValues(alpha: 0.1),
                Colors.pinkAccent.withValues(alpha: 0.05),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ),
      
      // Medium floating circle
      Positioned(
        top: 300 + 40 * math.cos(_animation.value * 2 * math.pi),
        left: 80 + 60 * math.sin(_animation.value * 2 * math.pi),
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                Colors.blueAccent.withValues(alpha: 0.1),
                Colors.blueAccent.withValues(alpha: 0.05),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ),
      
      // Small floating circle
      Positioned(
        top: 500 + 30 * math.sin(_animation.value * 3 * math.pi),
        right: 150 + 40 * math.cos(_animation.value * 3 * math.pi),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                Colors.purpleAccent.withValues(alpha: 0.1),
                Colors.purpleAccent.withValues(alpha: 0.05),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ),
      
      // Floating squares
      Positioned(
        top: 200 + 35 * math.cos(_animation.value * 1.5 * math.pi),
        left: 200 + 45 * math.sin(_animation.value * 1.5 * math.pi),
        child: Transform.rotate(
          angle: _animation.value * 2 * math.pi,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.cyanAccent.withValues(alpha: 0.1),
                  Colors.cyanAccent.withValues(alpha: 0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      
      // Another floating square
      Positioned(
        top: 600 + 25 * math.sin(_animation.value * 2.5 * math.pi),
        left: 50 + 35 * math.cos(_animation.value * 2.5 * math.pi),
        child: Transform.rotate(
          angle: -_animation.value * 1.5 * math.pi,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.orangeAccent.withValues(alpha: 0.1),
                  Colors.orangeAccent.withValues(alpha: 0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    ];
  }

  List<Widget> _buildFloatingParticles() {
    return List.generate(20, (index) {
      final random = math.Random(index);
      final size = 2.0 + random.nextDouble() * 3.0;
      final speed = 0.5 + random.nextDouble() * 1.0;
      final delay = random.nextDouble() * 2 * math.pi;
      
      return Positioned(
        top: 100 + 600 * random.nextDouble() + 
            50 * math.sin(_animation.value * speed * 2 * math.pi + delay),
        left: 50 + 300 * random.nextDouble() + 
            30 * math.cos(_animation.value * speed * 2 * math.pi + delay),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withValues(
              alpha: 0.1 + 0.1 * math.sin(_animation.value * 4 * math.pi + delay),
            ),
          ),
        ),
      );
    });
  }
}
