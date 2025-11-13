import 'package:flutter/material.dart';
import '../components/drill.dart';

class DrillListScreen extends StatelessWidget {
  const DrillListScreen({super.key, required this.themeToggle});
  final VoidCallback themeToggle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sportified Lesson Timer',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: themeToggle,
            icon: Icon(Theme.of(context).brightness == Brightness.dark ? Icons.light_mode : Icons.dark_mode, color: Colors.white),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 600;
          final padding = isWide ? 40.0 : 16.0;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: padding, vertical: 16),
            child: ListView(
              children: [
                Drill(
                  title: "Warmup",
                  drillIcon: Icons.directions_run,
                  description:
                      "Light jogging and stretching to prepare your body.",
                  drillDuration: Duration(minutes: 5),
                  themeToggle: themeToggle,
                ),
                Drill(
                  title: "Shooting Practice",
                  drillIcon: Icons.sports_soccer,
                  description:
                      "Focus on accuracy and form during your shots.",
                  drillDuration: Duration(minutes: 10),
                  themeToggle: themeToggle,
                ),
                Drill(
                  title: "Cooldown",
                  drillIcon: Icons.self_improvement,
                  description:
                      "Gentle stretching and deep breathing to recover and relax.",
                  drillDuration: Duration(minutes: 5),
                  themeToggle: themeToggle,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}