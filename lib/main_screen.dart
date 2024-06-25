import 'package:flutter/material.dart';
import 'package:streams_exercises/features/time/time_repository.dart';
import 'package:streams_exercises/features/time/time_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TimeRepository timeRepository = TimeRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TimeScreen(timeRepository: timeRepository);
                }));
              },
              child: const Text("Zum Time Screen"),
            ),
          ],
        ),
      ),
    );
  }
}