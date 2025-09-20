import 'package:flutter/material.dart';

class RealProjectImage extends StatelessWidget {
  final String projectTitle;
  final String category;
  final String description;

  const RealProjectImage({
    super.key,
    required this.projectTitle,
    required this.category,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: _getProjectColors(projectTitle),
        ),
      ),
      child: Stack(
        children: [
          // Background pattern
          Positioned.fill(
            child: CustomPaint(
              painter: _RealisticPatternPainter(projectTitle),
            ),
          ),
          
          // Content
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        category,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 20),
                
                // App content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // App icon
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          _getProjectIcon(projectTitle),
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // App title
                      Text(
                        projectTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                      const SizedBox(height: 8),
                      
                      // Description
                      Text(
                        description,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.8),
                          fontSize: 12,
                          height: 1.4,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      
                      const Spacer(),
                      
                      // Bottom section
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '4.8',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              'Download',
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.8),
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Color> _getProjectColors(String projectTitle) {
    switch (projectTitle) {
      case 'Movie App':
        return [
          const Color(0xFF1A1A2E),
          const Color(0xFF16213E),
          const Color(0xFF0F3460),
        ];
      case 'BMI Calculator':
        return [
          const Color(0xFF2D5016),
          const Color(0xFF4A7C59),
          const Color(0xFF6BCF7F),
        ];
      case 'Game Website':
        return [
          const Color(0xFF8B4513),
          const Color(0xFFCD853F),
          const Color(0xFFDEB887),
        ];
      case 'IoT Smart Controller':
        return [
          const Color(0xFF1E3A8A),
          const Color(0xFF3B82F6),
          const Color(0xFF60A5FA),
        ];
      default:
        return [
          const Color(0xFF374151),
          const Color(0xFF6B7280),
          const Color(0xFF9CA3AF),
        ];
    }
  }

  IconData _getProjectIcon(String projectTitle) {
    switch (projectTitle) {
      case 'Movie App':
        return Icons.movie;
      case 'BMI Calculator':
        return Icons.fitness_center;
      case 'Game Website':
        return Icons.sports_esports;
      case 'IoT Smart Controller':
        return Icons.smart_toy;
      default:
        return Icons.code;
    }
  }
}

class _RealisticPatternPainter extends CustomPainter {
  final String projectTitle;

  _RealisticPatternPainter(this.projectTitle);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.05)
      ..style = PaintingStyle.fill;

    // Draw realistic UI elements based on project type
    switch (projectTitle) {
      case 'Movie App':
        _drawMovieAppElements(canvas, size, paint);
        break;
      case 'BMI Calculator':
        _drawBMICalculatorElements(canvas, size, paint);
        break;
      case 'Game Website':
        _drawGameWebsiteElements(canvas, size, paint);
        break;
      case 'IoT Smart Controller':
        _drawIoTControllerElements(canvas, size, paint);
        break;
    }
  }

  void _drawMovieAppElements(Canvas canvas, Size size, Paint paint) {
    // Draw movie poster-like rectangles
    for (int i = 0; i < 3; i++) {
      final rect = Rect.fromLTWH(
        20 + i * 60,
        size.height * 0.3 + i * 20,
        50,
        70,
      );
      canvas.drawRRect(
        RRect.fromRectAndRadius(rect, const Radius.circular(8)),
        paint,
      );
    }
  }

  void _drawBMICalculatorElements(Canvas canvas, Size size, Paint paint) {
    // Draw calculator-like elements
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 3; j++) {
        final rect = Rect.fromLTWH(
          30 + j * 40,
          size.height * 0.4 + i * 30,
          30,
          25,
        );
        canvas.drawRRect(
          RRect.fromRectAndRadius(rect, const Radius.circular(4)),
          paint,
        );
      }
    }
  }

  void _drawGameWebsiteElements(Canvas canvas, Size size, Paint paint) {
    // Draw game-like elements
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    
    // Draw game character silhouette
    canvas.drawCircle(
      Offset(centerX, centerY),
      30,
      paint,
    );
    
    // Draw score elements
    for (int i = 0; i < 5; i++) {
      final rect = Rect.fromLTWH(
        size.width - 60,
        50 + i * 15,
        40,
        10,
      );
      canvas.drawRRect(
        RRect.fromRectAndRadius(rect, const Radius.circular(5)),
        paint,
      );
    }
  }

  void _drawIoTControllerElements(Canvas canvas, Size size, Paint paint) {
    // Draw IoT device elements
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    
    // Draw device outline
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(centerX, centerY),
          width: 80,
          height: 60,
        ),
        const Radius.circular(8),
      ),
      paint,
    );
    
    // Draw control buttons
    for (int i = 0; i < 3; i++) {
      canvas.drawCircle(
        Offset(centerX - 20 + i * 20, centerY + 20),
        8,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
