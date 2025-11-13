import 'package:flutter/material.dart';
import '../components/countdown_timer.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({
    super.key,
    required this.title,
    required this.drillDuration,
    required this.themeToggle,
  });

  final String title;
  final Duration drillDuration;
  final VoidCallback themeToggle;

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Sportified Lesson Timer',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: themeToggle,
            icon: Icon(Theme.of(context).brightness == Brightness.dark ? Icons.light_mode : Icons.dark_mode, color: Colors.white),
          ),
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(isWide ? 32 : 16),
          width: isWide ? 500 : double.infinity,
          child: Card(
            elevation: 6,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text("Total Duration: ${(drillDuration.inMinutes == 0 ? "${drillDuration.inSeconds} seconds" : "${drillDuration.inMinutes} minutes")}"),
                  const SizedBox(height: 16),
                  CountdownTimer(initialTime: drillDuration),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}