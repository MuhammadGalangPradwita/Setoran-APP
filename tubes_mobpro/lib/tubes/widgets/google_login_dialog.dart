import 'package:flutter/material.dart';

List<Map<String, dynamic>> accounts = [
  {"name": "Michael Alexander", "email": "michaelAlexander@gmail.com"},
  {"name": "Ichiee Ochaa", "email": "Ochaadoublea@gmail.com"},
  {"name": "Zuann Yann", "email": "yannZuan@gmail.com"},
  {"name": "Revalia Dea Dinata", "email": "onlyRevv@gmail.com"},
  {"name": "Farah Farash", "email": "rahhhhh@gmail.com"}
];

class GoogleLoginDialogue extends StatelessWidget {
  const GoogleLoginDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const GoogleLoginDialogueTitle(),
      content: SizedBox(
        width: 0,
        height: 305,
        child: ListView.separated(
          itemCount: accounts.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Image(
                  width: 28.68,
                  height: 30,
                  image: AssetImage('assets/images/icons8-person-96.png'),
                ),
                const SizedBox(
                  width: 9.03,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      accounts[index]['name'],
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    Text(accounts[index]['email'],
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF818181)))
                  ],
                )
              ],
            );
          },
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
      actions: const [
        Text(
          'To continue, Google will share your name, email address, and profile picture with SeToRan. Before using this app, review its privacy policy and terms of service.',
          style: TextStyle(color: Color(0xFF818181)),
        )
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
