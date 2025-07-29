import 'package:flutter/material.dart';

class AnsButton extends StatefulWidget {
  
  const AnsButton(
      //named parameter,positional parameter search ..
      {super.key,
      required this.ans,
      required this.onPressed
  });

  final String ans;
  final void Function () onPressed;


  @override
  State<AnsButton> createState() => _AnsButtonState();
}

class _AnsButtonState extends State<AnsButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed : widget.onPressed,

      //style of answer button
      style: ElevatedButton.styleFrom(
        //overlayColor: Color(0xFFFF6B6B),
        backgroundColor: Color(0xFF00B4D8),
        foregroundColor: const Color(0xFF0D324F), 
        shadowColor: Colors.black, 
        elevation: 4, 
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24), 
        minimumSize: const Size(300, 55), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), 
        ),
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.1,
        ),
      ),


      //if the text is long make it in center
      child :Text(widget.ans , textAlign: TextAlign.center,),
    );
  }
}
/**style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          backgroundColor: Colors.white,
            foregroundColor: const Color.fromARGB(255, 13, 50, 79),
            minimumSize: const Size(300, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
            ),
      ), */