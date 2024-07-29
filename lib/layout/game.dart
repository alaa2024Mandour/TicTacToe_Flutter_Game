import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  bool oTurn = true;
  List<String> displayXO =["","","","","","","","",""];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[800],
      body: GridView.builder(
        itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              tabbed(index);
            },
            child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color:Colors.grey)
                ),
              child: Center(
                child: Text(
                  displayXO[index],
                  // index.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          );
          }),
    );
  }

  void tabbed(int index){
    setState(() {
      if(oTurn){
        displayXO[index] = 'O';
      }else{
        displayXO[index] = 'X';
      }
      oTurn = !oTurn;
      checkWinner();
    });
  }

  void checkWinner(){
    if(displayXO[0]==displayXO[1] && displayXO[1]==displayXO[2] && displayXO[0]!=""){
      showWinDialog();
    }

    if(displayXO[3]==displayXO[4] && displayXO[4]==displayXO[5] && displayXO[3]!=""){
      showWinDialog();
    }

    if(displayXO[6]==displayXO[7] && displayXO[7]==displayXO[8] && displayXO[6]!=""){
      showWinDialog();
    }

    if(displayXO[0]==displayXO[3] && displayXO[3]==displayXO[6] && displayXO[0]!=""){
      showWinDialog();
    }

    if(displayXO[1]==displayXO[4] && displayXO[4]==displayXO[7] && displayXO[1]!=""){
      showWinDialog();
    }

    if(displayXO[2]==displayXO[5] && displayXO[5]==displayXO[8] && displayXO[2]!=""){
      showWinDialog();
    }

    if(displayXO[0]==displayXO[4] && displayXO[4]==displayXO[8] && displayXO[0]!=""){
      showWinDialog();
    }

    if(displayXO[2]==displayXO[4] && displayXO[4]==displayXO[6] && displayXO[2]!=""){
      showWinDialog();
    }
  }

  void showWinDialog(){
      showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              title: oTurn ?  const Text("Winner is : X") :  const Text("Winner is : O"),
            );
          }
          );
  }
}
