import 'package:flutter/material.dart';
import 'package:school_application/sidebar.dart';
import 'package:school_application/tile.dart';
import 'package:school_application/user.dart';

class GameScreen extends StatefulWidget {
  GameScreen({super.key, User? user}) {
    this.user = user ?? User.getFromCurrent();
  }

  late User user;

  @override
  State<StatefulWidget> createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  List<Tile> tileList = [];
  List<Widget> boardTiles = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 14; i++) {
      tileList.add(
        Tile(
          i % 4 == 0
              ? TileColor.red
              : i % 4 == 1
              ? TileColor.blue
              : i % 4 == 2
              ? TileColor.yellow
              : TileColor.black,
          i < 1
              ? 1
              : i > 13
              ? 13
              : i,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      toolbarHeight: 20,
      title: Center(
        child: Text(
          "${widget.user.name}'s Room",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    ),
    drawer: Sidebar(user: widget.user),
    body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 10,
          children: [
            // SizedBox(height: 15),
            // Center(
            //   child: Text(
            //     "${widget.user.name}'s Room",
            //     style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            //   ),
            // ),
            Container(
                  height: 5 * 60 * 0.8,
                  width: 20 * 40 * 0.8,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Stack(
                children: [
                  Center(child: Text("מפת המשחק")),
                  ...getDragTarget(context),
                ],
              ),
            ),
            SizedBox(height: 20),
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height*0.3,
                  width: MediaQuery.sizeOf(context).width*0.75,
                ),
                Positioned(
                  top: 0,
                  child: Image.asset("assets/board.png", scale: 2),
                ),
                ...tileList.map<Widget>((tile) {
                  int index = tileList.indexOf(tile);
                  return Positioned(
                    top: index > 10 ? 90 * 0.7 + 3 : 3,
                    left: index > 10
                        ? (index - 11) * 60 * 0.65 + 1
                        : index * 60 * 0.65 + 1,
                    child: Draggable<Tile>(
                      onDragEnd: (details) {
                        if (details.wasAccepted) {
                          // setState(() {
                            // tileList.remove(tile);
                            
                          // });
                        }
                      },
                      data: tile,
                      childWhenDragging: SizedBox(
                        height: 90 * 0.65,
                        width: 60 * 0.65,
                      ),
                      feedback: tile.generateImage(
                        height: 90 * 0.65,
                        width: 60 * 0.65,
                      ),
                      child: tile.generateImage(
                        height: 90 * 0.65,
                        width: 60 * 0.65,
                      ),
                    ),
                  );
                }),
              ],
            ),

            // SizedBox(
            //   height: 100,
            //   child: Expanded(
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.end,
            //       children: [
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //           children: [
            //             CircleAvatar(backgroundColor: Colors.red,),
            //             CircleAvatar(),
            //             CircleAvatar(),
            //             CircleAvatar(),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // )
          ],
        ),
      ),
    ),
  );

  List<Widget> getDragTarget(BuildContext context) {
    List<Widget> list = [];

    double scale = 0.8;

    for (
      int column = 0;
      column < 20;
      column++
    ) {
      for (
        int row = 0;
        row < 5;
        row++
      ) {
        Tile? tile;
        bool isHover = false;
        list.add(
          Positioned(
            top: row * 60 * scale,
            left: column * 40 * scale,
            child: DragTarget<Tile>(
              builder: (context, candidateData, rejectedData) => Container(
                height: 60 * scale,
                width: 40 * scale,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isHover ? Colors.grey.shade700 : Colors.grey.shade100,
                  ),
                ),
                child: tile != null ? Draggable<Tile>(
                  data: tile,
                  feedback: tile!.generateImage(height: 60 * scale, width: 40 * scale),
                  child: tile!.generateImage(height: 60 * scale, width: 40 * scale),
                ) : null
              ),
              onMove: (details) {
                tile ??= details.data;
                isHover = true;
              },
              onLeave: (data) {
                if (data == tile) tile = null;
                isHover = false;
              },
              onWillAcceptWithDetails: (details) {
                isHover = false;
                if (tile == null || tile == details.data) {
                  tile = details.data;
                  return true;
                }
                return false;
              },
            ),
          ),
        );
      }
    }

    return list;
  }
}
