import 'package:flutter/material.dart';
import 'package:tic_tac_toy_game/layout/game.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "TIC TAC TOE GAME",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                wordSpacing: 10,
              ),
            ),
            const SizedBox(height: 30,),
            const CircleAvatar(
            backgroundImage: AssetImage("images/game.png"),
              backgroundColor: Colors.transparent,
              radius: 150,
            ),
            const SizedBox(height: 50,),
            Container(
              width: 250,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(25),
              ),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Game()),
                  );
                },
                child: const Text(
                  "Play Game",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
