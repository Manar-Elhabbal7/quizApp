import 'package:flutter/material.dart';
import 'package:quiz/data/quesData.dart' show questions;

class Result extends StatelessWidget {
  const Result(this.selectedAnswers, this.onRestart, {super.key});
  final void Function() onRestart;
  final List<String> selectedAnswers;

  int getScore() {
    int score = 0;
    for (var i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == questions[i].answers[0]) {
        score++;
      }
    }
    return score;
  }

  List<Map<String, Object>> getSummary() {
    final summary = List.generate(questions.length, (index) {
      final isCorrect = selectedAnswers[index] == questions[index].answers[0];
      final statusEmoji = isCorrect ? '✅' : '❌';
      return {
        'Question number :': index + 1,
        'Question': questions[index].txt,
        'Your Answer': selectedAnswers[index],
        'Correct Answer': questions[index].answers[0],
        'Status': statusEmoji,
      };
    });
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'lib/congratulations.png',
            width: 300,
            height: 300,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 40),
          const Text(
            'Congratulations',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Your score is ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '${getScore()} / ${questions.length}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton.icon(
            icon: const Icon(Icons.restart_alt),
            label: const Text('Restart Quiz', style: TextStyle(fontSize: 18)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: const Size(50, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              foregroundColor: const Color.fromARGB(255, 13, 50, 79),
            ),
            onPressed: () {
              onRestart();
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            icon: const Icon(Icons.list_alt),
            label: const Text('  Summary  ', style: TextStyle(fontSize: 18)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color.fromARGB(255, 13, 50, 79),
              minimumSize: const Size(50, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              final summary = getSummary();
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  backgroundColor: const Color(0xFF1A2238),
                  title: const Text(
                    'Summary',
                    style: TextStyle(color: Colors.white),
                  ),
                  content: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: summary.map((entry) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            '${entry['Status']} Q${entry['Question number :']}: ${entry['Question']}\n'
                            'Your Answer: ${entry['Your Answer']}\n'
                            'Correct Answer: ${entry['Correct Answer']}\n',

                            style: const TextStyle(color: Colors.white70),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(ctx).pop(),
                      child: const Text(
                        'Close',
                        style: TextStyle(color: Colors.amber),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
