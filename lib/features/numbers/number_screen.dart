import 'package:flutter/material.dart';

import 'package:streams_exercises/features/numbers/number_repository.dart';

class NumberScreen extends StatelessWidget {
  const NumberScreen({
    super.key,
    required this.numberRepository,
  });

  final NumberRepository numberRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Screen'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: numberRepository.getNumberStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Text("Fehler beim Laden der Zahlen");
            } else if (!snapshot.hasData) {
              return const Text("Keine Zahlen verfügbar");
            } else {
              return Text(
                snapshot.data!.toString(),
                style: const TextStyle(fontSize: 24),
              );
            }
          },
        ),
      ),
    );
  }
}