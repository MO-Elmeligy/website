import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  final ScrollController scrollController;

  const CustomNavigationBar({
    super.key,
    required this.scrollController,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  bool isScrolled = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (widget.scrollController.offset > 100) {
      if (!isScrolled) {
        setState(() {
          isScrolled = true;
        });
      }
    } else {
      if (isScrolled) {
        setState(() {
          isScrolled = false;
        });
      }
    }
  }

  void _scrollToSection(int index) {
    final sections = [
      0.0, // Hero
      800.0, // About
      1600.0, // Projects
      2400.0, // Skills
      3200.0, // Contact
    ];

    if (index < sections.length) {
      widget.scrollController.animateTo(
        sections[index],
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 20, 
        vertical: isMobile ? 12 : 15
      ),
      decoration: BoxDecoration(
        color: isScrolled 
            ? Colors.black.withOpacity(0.8)
            : Colors.transparent,
        boxShadow: isScrolled
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo/Name
          Text(
            isMobile ? 'M.Elmeligy' : 'Mohamed Elmeligy',
            style: TextStyle(
              fontSize: isMobile ? 18 : 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 5,
                ),
              ],
            ),
          ),
          
          // Navigation Items
          isMobile 
            ? _buildMobileMenu(context, isMobile)
            : Row(
                children: [
                  _NavItem(
                    label: 'Home',
                    onTap: () => _scrollToSection(0),
                  ),
                  _NavItem(
                    label: 'About',
                    onTap: () => _scrollToSection(1),
                  ),
                  _NavItem(
                    label: 'Projects',
                    onTap: () => _scrollToSection(2),
                  ),
                  _NavItem(
                    label: 'Skills',
                    onTap: () => _scrollToSection(3),
                  ),
                  _NavItem(
                    label: 'Contact',
                    onTap: () => _scrollToSection(4),
                  ),
                ],
              ),
        ],
      ),
    );
  }
  
  Widget _buildMobileMenu(BuildContext context, bool isMobile) {
    return PopupMenuButton<String>(
      icon: const Icon(
        Icons.menu,
        color: Colors.white,
        size: 28,
      ),
      onSelected: (value) {
        switch (value) {
          case 'home':
            _scrollToSection(0);
            break;
          case 'about':
            _scrollToSection(1);
            break;
          case 'projects':
            _scrollToSection(2);
            break;
          case 'skills':
            _scrollToSection(3);
            break;
          case 'contact':
            _scrollToSection(4);
            break;
        }
      },
      itemBuilder: (BuildContext context) => [
        const PopupMenuItem<String>(
          value: 'home',
          child: Text('Home'),
        ),
        const PopupMenuItem<String>(
          value: 'about',
          child: Text('About'),
        ),
        const PopupMenuItem<String>(
          value: 'projects',
          child: Text('Projects'),
        ),
        const PopupMenuItem<String>(
          value: 'skills',
          child: Text('Skills'),
        ),
        const PopupMenuItem<String>(
          value: 'contact',
          child: Text('Contact'),
        ),
      ],
    );
  }
}

class _NavItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _NavItem({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: onTap,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
