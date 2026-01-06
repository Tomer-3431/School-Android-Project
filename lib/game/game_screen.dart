import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_application/game/game_manager.dart';
import 'package:school_application/game/game_spot.dart';
import 'package:school_application/sidebar.dart';
import 'package:school_application/game/tile.dart';
import 'package:school_application/user.dart';

class GameScreen extends StatefulWidget {
  GameScreen({super.key, User? user}) {
    this.user = user ?? User.getFromCurrent();
  }

  late User user;
  late GameManager gameManager;

  @override
  State<StatefulWidget> createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  // List<Tile> tileList = [];
  // List<Widget> boardTiles = [];

  @override
  void initState() {
    super.initState();

    // for (int i = 0; i < 14; i++) {
    //   tileList.add(
    //     Tile(
    //       i < 4
    //           ? i % 4 == 0
    //                 ? TileColor.red
    //                 : i % 4 == 1
    //                 ? TileColor.blue
    //                 : i % 4 == 2
    //                 ? TileColor.yellow
    //                 : TileColor.black
    //           : TileColor.black,
    //       i < 4
    //           ? 1
    //           : i > 13
    //           ? 13
    //           : i,
    //     ),
    //   );
    // }
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      toolbarHeight: 30,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
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
                Row(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 5 * 60 * 0.8,
                      width: 20 * 40 * 0.8,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Stack(
                        children: [
                          Center(child: Text("מפת המשחק")),
                          ...getGameMap(tiles: widget.gameManager.gameMap),
                        ],
                      ),
                    ),

                    Container(
                      width: 60,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade800),
                      ),
                      child: FloatingActionButton(
                        onPressed: () {},
                        elevation: 2,
                        backgroundColor: Color.fromARGB(255, 254, 243, 229),
                        foregroundColor: Colors.black,
                        child: Text(
                          "${widget.gameManager.stock.length}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
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
                    ...getGameBoard(tiles: widget.gameManager.getMyBoard()),
                    // ...tileList.map<Widget>((tile) {
                    //   int index = tileList.indexOf(tile);
                    //   return Positioned(
                    //     top: index > 10 ? 90 * 0.7 + 3 : 3,
                    //     left: index > 10
                    //         ? (index - 11) * 60 * 0.65 + 1
                    //         : index * 60 * 0.65 + 1,
                    //     child: Draggable<Tile>(
                    //       onDragEnd: (details) {
                    //         if (details.wasAccepted) {
                    //           // setState(() {
                    //           // tileList.remove(tile);

                    //           // });
                    //         }
                    //       },
                    //       data: tile,
                    //       childWhenDragging: SizedBox(
                    //         height: 90 * 0.65,
                    //         width: 60 * 0.65,
                    //       ),
                    //       feedback: tile.generateImage(
                    //         height: 90 * 0.65,
                    //         width: 60 * 0.65,
                    //       ),
                    //       child: tile.generateImage(
                    //         height: 90 * 0.65,
                    //         width: 60 * 0.65,
                    //       ),
                    //     ),
                    //   );
                    // }),
                  ],
                ),
              ],
            ),

            SizedBox(width: 20),

            Column(
              spacing: 50,
              children: [
                Row(
                  children: [
                    Column(
                      spacing: 10,
                      children: [
                        Row(
                          spacing: 20,
                          children: [
                            Container(
                              height: 60,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                border: BoxBorder.all(
                                  color: Colors.grey.shade700,
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "1",
                                  style: TextStyle(
                                    color: Colors.redAccent.shade100,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                            CircleAvatar(backgroundColor: Colors.red),
                          ],
                        ),
                        Row(
                          spacing: 20,
                          children: [
                            Container(
                              height: 60,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                border: BoxBorder.all(
                                  color: Colors.grey.shade700,
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                    color: Colors.blueAccent.shade100,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                            CircleAvatar(),
                          ],
                        ),
                        widget.gameManager.players.length > 2
                            ? Row(
                                spacing: 20,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      border: BoxBorder.all(
                                        color: Colors.grey.shade700,
                                        width: 1,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "3",
                                        style: TextStyle(
                                          color: Colors.yellowAccent.shade100,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                  CircleAvatar(),
                                ],
                              )
                            : Container(),
                        widget.gameManager.players.length > 3
                            ? Row(
                                spacing: 20,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      border: BoxBorder.all(
                                        color: Colors.grey.shade700,
                                        width: 1,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "4",
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                            255,
                                            89,
                                            129,
                                            110,
                                          ),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                  CircleAvatar(),
                                ],
                              )
                            : Container(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );

  List<Widget> getGameBoard({Iterable<Tile?>? tiles}) {
    List<Widget> list = [];

    double scale = 1;

    int i = 0;
    for (int row = 0; row < 2; row++) {
      List<GlobalKey<GameSpotState>> tileList = [];

      for (int column = 0; column < 17; column++) {
        GlobalKey<GameSpotState> key = GlobalKey(
          debugLabel: 'row:$row|column:$column',
        );
        GameSpot gameSpot = GameSpot(
          key: key,
          scale: scale,
          borderColor: Colors.transparent,
          getKeys: () => tileList,
          tile: tiles?.elementAtOrNull(i),
        );
        tileList.add(key);
        list.add(
          Positioned(
            top: row * 62 * scale + 2,
            left: column * 40 * scale + 7,
            child: gameSpot,
          ),
        );
        i++;
      }
    }

    return list;
  }

  List<Widget> getGameMap({GameMap? tiles}) {
    List<Widget> list = [];

    double scale = 0.8;

    for (int row = 0; row < 5; row++) {
      List<GlobalKey<GameSpotState>> tileList = [];

      for (int column = 0; column < 20; column++) {
        GlobalKey<GameSpotState> key = GlobalKey(
          debugLabel: 'row:$row|column:$column',
        );
        GameSpot gameSpot = GameSpot(
          key: key,
          scale: scale,
          getKeys: () => tileList,
          tile: tiles?.getTile(row, column),
          row: row,
          column: column,
          onAccept: onAccept,
          checkTurn: widget.gameManager.checkMyTurn,
        );
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

  void onAccept(int row, int column, Tile? tile) {
    widget.gameManager.gameMap.updateTile(row, column, tile);
  }
}
