import 'package:flutter/material.dart';

class GoogleLoginDialogue extends StatelessWidget {
  const GoogleLoginDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: GoogleLoginDialogueTitle(),
      children: [
        SizedBox(
          width: 100,
          height: 20,
          child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Text('1');
              }),
        ),
      ],
    );
  }
}

class GoogleLoginDialogueTitle extends StatelessWidget {
  const GoogleLoginDialogueTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: 52.59, height: 55,
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(25))),
        // child: const Text('data'),
      ),
      const SizedBox(
        height: 10,
      ),
      const Text(
        'Choose an Account',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      RichText(
        text: const TextSpan(
          style: TextStyle(
            fontSize: 8, // Adjust font size as needed
            color: Colors.black,
          ),
          children: <TextSpan>[
            TextSpan(text: 'to continue to '),
            TextSpan(
              text: 'SeToRan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
