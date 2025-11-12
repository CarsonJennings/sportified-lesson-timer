import 'package:flutter/material.dart';
import 'dart:async';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue,
        title: const Text(
          'Sportified Lesson Timer',
          style: TextStyle(
            color: Colors.white
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: ListView(
            children: const <Widget>[
              Drill(
                title: "Warmup",
                drillIcon: Icons.directions_run,
                description: "Light jogging and stretching to prepare your body.",
                drillDuration: Duration(seconds: 10)
              ),
              Drill(
                title: "Shooting practice",
                drillIcon: Icons.sports_soccer,
                description: "Focus on accuracy and form during your shots.",
                drillDuration: Duration(minutes: 10)
              ),
              Drill(
                title: "Cooldown",
                drillIcon: Icons.sports_gymnastics,
                description: "Gentle stretching and deep breathing to recover and relax.",
                drillDuration: Duration(minutes: 5)
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Drill extends StatelessWidget {
  const Drill({super.key, required this.title, required this.drillIcon, required this.description, required this.drillDuration});

  final String title;
  final IconData drillIcon;
  final String description;
  final Duration drillDuration;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context,
          MaterialPageRoute(
            builder: (_) => TimerScreen(title: title, drillDuration: drillDuration),
          ),
        );
      },
      
      child: ListTile(
        leading: Icon(drillIcon), 
        title: Text(title),
        subtitle: 
          Text("$description\n${drillDuration.inMinutes.toString()} minutes"),
      ),
    );
  }
}


class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key, required this.title, required this.drillDuration});

  final String title;
  final Duration drillDuration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          'Sportified Lesson Timer',
          style: TextStyle(
            color: Colors.white
            ),
          ),
        ),
      body: 
        Center(
          child: Column(
            children: [
              Text(title),
              Text('Total Duration: ${drillDuration.inMinutes.toString()} minutes'),
              CountdownTimer(initialTime: drillDuration,),
            ],
          )
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
    timeLeft = widget.initialTime.inSeconds;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isRunning = timer?.isActive ?? false;

    return Column(
      
      children: [
        Text(formatTime(Duration(seconds: timeLeft))),
        timeLeft <= 0 ? Text('Done!') 
        :
        Tooltip(
          message: isRunning ? 'Pause timer' : 'Start timer',
          child: (ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateColor.resolveWith(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return Colors.blueAccent;
                }
                return Colors.blue;
              }
            ),
          ),
          onPressed: () {
            if (isRunning) {
              pauseTimer();
            } else {
              startTimer();
            }
          },
          child: Icon(isRunning ? Icons.pause : Icons.play_arrow),
                )),
        ),
      Tooltip(
        message: 'Reset timer',
        child: ElevatedButton(
          onPressed: (resetTimer),
          child: Icon(Icons.restart_alt)),
      )
      ]
    );
  }

void startTimer() {
  timer = Timer.periodic(Duration(seconds: 1), (timer) {
    setState(() {
      timeLeft--;
      if (timeLeft <= 0) timer.cancel();
    });
  });

  setState(() {}); // Call an additonal setState so first time start is clicked UI updates immediately and not after 1 second
}

void pauseTimer() {
  setState(() {
    timer?.cancel();
  });
}

void resetTimer() {
  setState(() {
    timer?.cancel();
    timeLeft = widget.initialTime.inSeconds;
  });
}

String formatTime(Duration time) {
  return time.toString().split('.')[0];
}

@override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

}


