import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  bool oTurn = true;
  List<String> displayXO =['','','','','','','','',''];

  var titleStyle = const TextStyle(
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.bold,
    wordSpacing: 10,
  );

  int oScore =0;
  int xScore =0;


  int fillBox =0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Expanded(
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Player X",
                        style:titleStyle,
                      ),
                      Text(
                        "$xScore",
                        style:titleStyle,
                      )

                    ],
                  ),
                  const SizedBox(width:50,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Player O",
                        style:titleStyle,
                      ),
                      Text(
                        "$oScore",
                        style:titleStyle,
                      )

                    ],
                  ),
                ],
              )),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){
                    if(displayXO[index] == ''){
                      tabbed(index);
                    }
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
                          fontWeight: FontWeight.bold,
                          fontSize: 35
                        ),
                      ),
                    ),
                  ),
                );
                }),
          ),
          Expanded(
            child: Center(
              child: Text(
              " TEC TAC TOE ",
              style:titleStyle,
                        ),
            ),)
        ],
      ),
    );
  }

  void tabbed(int index){
    setState(() {
      if(oTurn ){
        displayXO[index] = 'O';
        fillBox++;
      }else{
        displayXO[index] = 'X';
        fillBox++;
      }
      oTurn = !oTurn;
      checkWinner();
    });
  }

  void checkWinner(){
    if(displayXO[0]==displayXO[1] && displayXO[1]==displayXO[2] && displayXO[0]!=''){
      showWinDialog();
    }

    else if(displayXO[3]==displayXO[4] && displayXO[4]==displayXO[5] && displayXO[3]!=''){
      showWinDialog();
    }

    else if(displayXO[6]==displayXO[7] && displayXO[7]==displayXO[8] && displayXO[6]!=''){
      showWinDialog();
    }

    else if(displayXO[0]==displayXO[3] && displayXO[3]==displayXO[6] && displayXO[0]!=''){
      showWinDialog();
    }

    else if(displayXO[1]==displayXO[4] && displayXO[4]==displayXO[7] && displayXO[1]!=''){
      showWinDialog();
    }

    else if(displayXO[2]==displayXO[5] && displayXO[5]==displayXO[8] && displayXO[2]!=''){
      showWinDialog();
    }

    else if(displayXO[0]==displayXO[4] && displayXO[4]==displayXO[8] && displayXO[0]!=''){
      showWinDialog();
    }
    else if(displayXO[2]==displayXO[4] && displayXO[4]==displayXO[6] && displayXO[2]!=''){
      showWinDialog();
    }
    else if ( fillBox == 9){
      showDrawDialog();
    }
  }

  void showWinDialog(){
      showDialog(
        barrierDismissible: false,
          context: context,
          builder: (context){
            if (oTurn){
              xScore++;
              return  AlertDialog(
                title: const Text("Winner is : X"),
                actions: <Widget>[
                  TextButton(
                      onPressed: (){
                        clearBoard();
                        Navigator.of(context).pop();
                      },
                      child: const Text("Try Again"))
                ],
              );
            }
            else{
              oScore++;
              return  AlertDialog(
                title: const Text("Winner is : O"),
                actions: <Widget>[
                  TextButton(
                      onPressed: (){
                        clearBoard();
                        Navigator.of(context).pop();
                      },
                      child: const Text("Try Again"))
                ],
              );
            }

          }
          );
  }

  void showDrawDialog(){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context){
           return AlertDialog(
              title: const Text("Draw"),
              actions: <Widget>[
                TextButton(
                    onPressed: (){
                      clearBoard();
                      Navigator.of(context).pop();
                    },
                    child: const Text("Try Again"))
              ],
            );
        }
    );
  }

  void clearBoard(){
    setState(() {
      displayXO =['','','','','','','','',''];
    });
    fillBox=0;
  }
}
