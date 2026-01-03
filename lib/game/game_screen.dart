import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:school_application/game/game_spot.dart';
import 'package:school_application/sidebar.dart';
import 'package:school_application/game/tile.dart';
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
          i < 4 ?
          i % 4 == 0
              ? TileColor.red
              : i % 4 == 1
              ? TileColor.blue
              : i % 4 == 2
              ? TileColor.yellow
              : TileColor.black :
              TileColor.black,
          i < 4
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
                  ...getGameMap(context),
                ],
              ),
            ),
            SizedBox(height: 20),
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  width: MediaQuery.sizeOf(context).width * 0.75,
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

  List<Widget> getGameMap(BuildContext context) {
    List<Widget> list = [];

    double scale = 0.8;

    for (int row = 0; row < 5; row++) {
      List<GlobalKey<GameSpotState>> tileList = [];

      for (int column = 0; column < 20; column++) {
        GlobalKey<GameSpotState> key = GlobalKey(debugLabel: 'row:$row|column:$column');
        GameSpot gameSpot = GameSpot(key: key,scale: scale, getKeys: () => tileList,);
        tileList.add(key);
        list.add(
          Positioned(
            top: row * 60 * scale,
            left: column * 40 * scale,
            child: gameSpot,
          ),
        );
      }

    }

    return list;
  }
}
