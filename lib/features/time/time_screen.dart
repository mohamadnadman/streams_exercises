import 'package:flutter/material.dart';
import 'package:streams_exercises/features/time/time_repository.dart';


class TimeScreen extends StatelessWidget {
  const TimeScreen({
    super.key,
    required this.timeRepository,
  });

  final TimeRepository timeRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Screen'),
      ),
      body: Center(
        child: StreamBuilder<DateTime>(
          stream: timeRepository.dateTimeStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Text("Fehler beim Laden der Zeit");
            } else if (!snapshot.hasData) {
              return const Text("Keine Zeitdaten verfügbar");
            } else {
              return Text(
                snapshot.data!.toLocal().toString(),
                style: const TextStyle(fontSize: 24),
              );
            }
          },
        ),
      ),
    );
  }
}