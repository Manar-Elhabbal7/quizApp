import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  const Home(this.switchScreen ,{super.key});

  final void Function () switchScreen;
  @override
  Widget build(BuildContext context) {
    
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'lib/logoo.png',
            width: 300,
            height: 300,
            fit: BoxFit.contain,
          ),
          
          const SizedBox(height: 15),

          ElevatedButton.icon(
            icon:  const Icon(Icons.assessment),
            label: const Text('Start Quiz',
            style :TextStyle(fontSize : 18),
            ),
            
            style: ElevatedButton.styleFrom(
              
              backgroundColor: Colors.white,
              minimumSize: const Size(150, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              foregroundColor: const Color.fromARGB(255, 13, 50, 79),
            ),
            onPressed: switchScreen,
          )
        ],
      ),
    );
  }
}

