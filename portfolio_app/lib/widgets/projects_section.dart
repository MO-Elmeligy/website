import 'package:flutter/material.dart';
import '../models/project.dart';
import 'real_project_image.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = _getProjects();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: Column(
        children: [
          // Section Title
          Text(
            'My Projects',
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
          
          // Projects Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.2,
            ),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              return _ProjectCard(project: projects[index]);
            },
          ),
        ],
      ),
    );
  }

  List<Project> _getProjects() {
    return [
      const Project(
        title: 'Movie App',
        description: 'Discover and explore movies with TMDB API integration. Modern UI with BLoC state management.',
        imageUrl: 'assets/images/Screenshot 2025-08-02 000231.png',
        technologies: ['Flutter', 'Dart', 'BLoC', 'TMDB API', 'HTTP'],
        githubUrl: 'https://github.com/MO-Elmeligy/movie-app',
        category: 'Mobile App',
      ),
      const Project(
        title: 'BMI Calculator',
        description: 'Calculate your Body Mass Index with a clean, intuitive interface and real-time results.',
        imageUrl: 'assets/images/Screenshot 2025-08-02 000152.png',
        technologies: ['Flutter', 'Dart', 'Material Design'],
        githubUrl: 'https://github.com/MO-Elmeligy/bmi-calculator',
        category: 'Mobile App',
      ),
      const Project(
        title: 'Game Website',
        description: 'Dynamic player information display with Firebase backend and real-time updates.',
        imageUrl: 'assets/images/Screenshot 2025-09-20 155643.png',
        technologies: ['Flutter Web', 'Firebase', 'Real-time Database'],
        githubUrl: 'https://github.com/MO-Elmeligy/game-website',
        liveUrl: 'https://game-website-demo.web.app',
        category: 'Web App',
      ),
      const Project(
        title: 'IoT Smart Controller',
        description: 'Control smart devices via Bluetooth. ESP32 integration for fan speed and cooking modes.',
        imageUrl: 'assets/images/WhatsApp Image 2025-09-20 at 16.11.21_e2fea6d5.jpg',
        technologies: ['Flutter', 'Bluetooth', 'ESP32', 'Arduino', 'IoT'],
        githubUrl: 'https://github.com/MO-Elmeligy/iot-smart-controller',
        category: 'IoT App',
      ),
    ];
  }
}

class _ProjectCard extends StatelessWidget {
  final Project project;

  const _ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Image
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.3),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.asset(
                  project.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return RealProjectImage(
                      projectTitle: project.title,
                      category: project.category,
                      description: project.description,
                    );
                  },
                ),
              ),
            ),
          ),
          
          // Project Info
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category Badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      project.category,
                      style: const TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Title
                  Text(
                    project.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Description
                  Expanded(
                    child: Text(
                      project.description,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white70,
                        height: 1.4,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Technologies
                  Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    children: project.technologies.take(3).map((tech) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          tech,
                          style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 10,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Open GitHub
                          },
                          icon: const Icon(Icons.code, size: 16),
                          label: const Text('Code'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      
                      if (project.liveUrl != null) ...[
                        const SizedBox(width: 8),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {
                              // Open live demo
                            },
                            icon: const Icon(Icons.open_in_new, size: 16),
                            label: const Text('Live'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: const BorderSide(color: Colors.white),
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}

