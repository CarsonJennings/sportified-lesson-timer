import 'package:flutter/material.dart';
import 'dart:async';

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