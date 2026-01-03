import 'package:flutter/material.dart';

class Tile {
  final TileColor color;
  final int num;

  const Tile(this.color, this.num);

  Widget generateImage({double width = 120, double height = 180}) => Stack(
    children: [
      Positioned(
        right: 0.18 * width,
        top: 1,
        child: SizedBox(
          width: width * 0.6,
          height: height * 0.75,
          child: ColoredBox(color: color.color),
        ),
      ),
      Image.asset(
        "assets/tiles/rummikub tile $num.png",
        width: width,
        height: height,
      ),
    ],
  );

  @override
  String toString() {
    return "Tile:\nnum=$num\ncolor=$color";
  }

  static bool isLegul(Iterable<Tile> tiles) {
    if (tiles.length < 3) return false;

    if (tiles.first.num == tiles.elementAt(1).num-1) {
      for (int i = 0; i < tiles.length; i++) {
        if (tiles.elementAt(i).num-i != tiles.first.num
        && tiles.elementAt(i).color != tiles.first.color) {
          return false;
        }
      }
      return true;
    }

    if (tiles.first.num == tiles.elementAt(1).num) {
      List<TileColor> colors = [];
      for (int i = 0; i < tiles.length; i++) {
        if (tiles.elementAt(i).num == tiles.first.num) {
          for (int j = 0; j < colors.length; j++) {
            if (colors.elementAt(j) == tiles.elementAt(i).color) return false;
          }
          colors.add(tiles.elementAt(i).color);;;;
        }
      }
      return true;
    }

    return false;
  }
}

enum TileColor {
  red(Colors.red),
  blue(Colors.blue),
  yellow(Colors.amber),
  black(Colors.black);

  final Color color;

  const TileColor(this.color);
}
