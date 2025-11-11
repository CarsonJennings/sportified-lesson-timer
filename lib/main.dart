import 'package:flutter/material.dart';


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
                drillDuration: Duration(minutes: 5)
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
            builder: (_) => TimerScreen(),
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
  const TimerScreen({super.key});

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
          child: Text('timer to go here')
        ),
    );
  }
}
