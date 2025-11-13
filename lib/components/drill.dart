import 'package:flutter/material.dart';
import '../screens/timer_screen.dart';

class Drill extends StatelessWidget {
  const Drill({
    super.key,
    required this.title,
    required this.drillIcon,
    required this.description,
    required this.drillDuration,
    required this.themeToggle,
  });

  final String title;
  final IconData drillIcon;
  final String description;
  final Duration drillDuration;
  final VoidCallback themeToggle;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        hoverColor: Colors.blue.withValues(alpha: 0.05),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  TimerScreen(title: title, drillDuration: drillDuration, themeToggle: themeToggle,),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(drillIcon, size: 40, color: Colors.blueAccent),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 4),
                    Text(description),
                    const SizedBox(height: 8),
                    Text(
                      (drillDuration.inMinutes == 0 ? "${drillDuration.inSeconds} secs" : "${drillDuration.inMinutes} mins"),
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios_rounded, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}