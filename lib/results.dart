import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final Map<String, int> results;
  final VoidCallback restart;

  const Results({super.key, required this.results, required this.restart});

  String getTopPersonality() =>
      results.entries.reduce((a, b) => a.value >= b.value ? a : b).key;

  @override
  Widget build(BuildContext context) {
    final topPersonality = getTopPersonality();
    final personality = personalityDetails[topPersonality]!;

    return Container(
      color: Colors.blueGrey[900],
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('You are $topPersonality',
                  style: const TextStyle(fontSize: 28, color: Colors.white)),
              Text(personality['emoji']!, style: const TextStyle(fontSize: 60)),
              Text(personality['description']!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20, color: Colors.white70)),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: restart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: const Text('Restart',
                    style: TextStyle(fontSize: 18, color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const Map<String, Map<String, String>> personalityDetails = {
  'Thinker': {
    'emoji': '🧠',
    'description': 'Analytical, logical, and loves solving complex problems.'
  },
  'Feeler': {
    'emoji': '💖',
    'description': 'Empathetic, caring, and values deep connections with others.'
  },
  'Planner': {
    'emoji': '📆',
    'description': 'Organized, methodical, and likes having a clear plan.'
  },
  'Adventurer': {
    'emoji': '🗺️',
    'description': 'Spontaneous, bold, and always exploring.'
  },
};
