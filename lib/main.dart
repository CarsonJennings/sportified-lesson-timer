import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _appTheme = ThemeMode.light;

  void toggleTheme () {
    setState(() {
      _appTheme = _appTheme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sportified Lesson Timer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
      darkTheme: ThemeData( // dark mode
        brightness: Brightness.dark,
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
      themeMode: _appTheme,
      home: DrillListScreen(themeToggle: toggleTheme),
    );
  }
}

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

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({super.key, required this.initialTime});
  final Duration initialTime;

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  Timer? timer;
  late int timeLeft;

  @override
  void initState() {
    super.initState();
    timeLeft = widget.initialTime.inSeconds;
  }

  @override
  Widget build(BuildContext context) {
    final isRunning = timer?.isActive ?? false;
    final textStyle = Theme.of(context)
        .textTheme
        .headlineMedium
        ?.copyWith(fontWeight: FontWeight.bold);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(formatTime(Duration(seconds: timeLeft)), style: textStyle),
        const SizedBox(height: 20),
        Wrap(
          spacing: 16,
          children: [
            Tooltip(
              message: isRunning ? 'Pause timer' : 'Start timer',
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (isRunning) {
                    pauseTimer();
                  } else {
                    startTimer();
                  }
                },
                icon: Icon(isRunning ? Icons.pause : Icons.play_arrow),
                label: Text(isRunning ? 'Pause' : 'Start'),
              ),
            ),
            Tooltip(
              message: 'Reset timer',
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[700],
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: resetTimer,
                icon: const Icon(Icons.restart_alt),
                label: const Text('Reset'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (timeLeft <= 0)
          const Text('Done!',
              style: TextStyle(color: Colors.green, fontSize: 20)),
      ],
    );
  }

  void startTimer() {
    if (timeLeft <= 0) { // If timer has finished reset timer first
      resetTimer();
    }
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        timeLeft--;
        if (timeLeft <= 0) timer.cancel();
      });
    });
    setState(() {}); // Update UI immediately
  }

  void pauseTimer() {
    timer?.cancel();
    setState(() {});
  }

  void resetTimer() {
    timer?.cancel();
    setState(() {
      timeLeft = widget.initialTime.inSeconds;
    });
  }

  String formatTime(Duration time) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(time.inMinutes.remainder(60));
    final seconds = twoDigits(time.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}