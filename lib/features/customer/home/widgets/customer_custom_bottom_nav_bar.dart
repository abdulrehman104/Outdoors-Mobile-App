import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: const BoxDecoration(
        color: Color(0xFF1A1A1A), // Dark background
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)), // Rounded only at top
        border: Border.fromBorderSide(
          BorderSide(
            color: Color(0xFF2A2A2A),
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home_outlined, Icons.home, "Home", 0),
          _buildNavItem(Icons.history_outlined, Icons.history, "History", 1),
          _buildNavItem(Icons.chat_bubble_outline, Icons.chat_bubble, "Chats", 2),
          _buildNavItem(Icons.person_outline, Icons.person, "Profile", 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(
      IconData outlinedIcon,
      IconData filledIcon,
      String label,
      int index,
      ) {
    bool isSelected = index == currentIndex;
    return InkWell(
      onTap: () => onTap(index),
      borderRadius: BorderRadius.circular(25),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: isSelected
            ? BoxDecoration(
          color: const Color(0xFF2D4A2D), // Dark green background
          borderRadius: BorderRadius.circular(25),
        )
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? filledIcon : outlinedIcon,
              color: isSelected
                  ? const Color(0xFF7ED321) // Bright green for selected
                  : const Color(0xFF666666), // Gray for unselected
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? const Color(0xFF7ED321)
                    : const Color(0xFF666666),
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}