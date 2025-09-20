import 'package:flutter/material.dart';

class ProjectImagePlaceholder extends StatelessWidget {
  final String projectTitle;
  final String category;
  final Color primaryColor;
  final Color secondaryColor;

  const ProjectImagePlaceholder({
    super.key,
    required this.projectTitle,
    required this.category,
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [primaryColor, secondaryColor],
        ),
      ),
      child: Stack(
        children: [
          // Background pattern
          Positioned.fill(
            child: CustomPaint(
              painter: _PatternPainter(),
            ),
          ),
          
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon based on category
                Icon(
                  _getCategoryIcon(),
                  size: 60,
                  color: Colors.white.withValues(alpha: 0.9),
                ),
                
                const SizedBox(height: 16),
                
                // Project title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    projectTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                
                const SizedBox(height: 8),
                
                // Category
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    category,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getCategoryIcon() {
    switch (category.toLowerCase()) {
      case 'mobile app':
        return Icons.phone_android;
      case 'web app':
        return Icons.web;
      case 'iot app':
        return Icons.smart_toy;
      default:
        return Icons.code;
    }
  }
}

class _PatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.1)
      ..style = PaintingStyle.fill;

    // Draw circles pattern
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 3; j++) {
        final x = (i * size.width / 4) + (j * 20);
        final y = (j * size.height / 2) + (i * 30);
        
        canvas.drawCircle(
          Offset(x, y),
          20 + (i * 5),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
