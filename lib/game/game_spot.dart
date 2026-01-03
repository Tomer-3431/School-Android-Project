import 'package:flutter/material.dart';
import 'package:school_application/game/tile.dart';

class GameSpot extends StatefulWidget {
  GameSpot({
    GlobalKey<GameSpotState>? key,
    this.scale = 1,
    required this.getKeys,
  }) : super(key: key);

  final double scale;
  List<GlobalKey<GameSpotState>> Function() getKeys;

  @override
  State<StatefulWidget> createState() => GameSpotState();
}

class GameSpotState extends State<GameSpot> {
  Tile? tile;
  bool isHover = false;
  bool isLegul = false;


  void setToLegul() {
    setState(() {
      isLegul = true;
    });
  }

  @override
  Widget build(BuildContext context) => DragTarget<Tile>(
    builder: (context, candidateData, rejectedData) => Container(
      height: 60 * widget.scale,
      width: 40 * widget.scale,
      decoration: BoxDecoration(
        border: Border.all(
          color: isLegul
              ? Colors.deepOrange
              : isHover
              ? Colors.grey.shade700
              : Colors.grey.shade100,
        ),
      ),
      child: tile != null
          ? Draggable<Tile>(
              data: tile,
              feedback: tile!.generateImage(
                height: 60 * widget.scale,
                width: 40 * widget.scale,
              ),
              child: tile!.generateImage(
                height: 60 * widget.scale,
                width: 40 * widget.scale,
              ),
            )
          : null,
    ),
    onMove: (details) {
      tile ??= details.data;
      isHover = true;
    },
    onLeave: (data) {
      if (data == tile) tile = null;
      isHover = false;
    },
    onAcceptWithDetails: (details) {
        List<GlobalKey<GameSpotState>> tileList = widget.getKeys();

        Map<GlobalKey<GameSpotState>, Tile> checkList = {};
        for (int i = 0; i < tileList.length; i++) {
          if (tileList.elementAt(i).currentState == null) break;
          if (tileList.elementAt(i).currentState!.tile == null) break;
          checkList.addEntries(
            {
              tileList.elementAt(i): tileList.elementAt(i).currentState!.tile!,
            }.entries,
          );
        }

        if (Tile.isLegul(checkList.values)) {
          for (int i = 0; i < checkList.length; i++) {
            checkList.keys.elementAt(i).currentState!.setToLegul();
          }
        }
    },
    onWillAcceptWithDetails: (details) {
      isHover = false;
      if (tile == null || tile == details.data) {
        tile = details.data;

        return true;
      }
      return false;
    },
  );
}
