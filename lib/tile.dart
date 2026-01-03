import 'package:flutter/material.dart';

class Tile {
  final TileColor color;
  final int num;

  const Tile(this.color, this.num);

  Widget generateImage({double width = 120, double height = 180}) => Stack(
    children: [
      Positioned(
        right: 0.18 * width,
        top: 0,
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
}

enum TileColor {
  red(Colors.red),
  blue(Colors.blue),
  yellow(Colors.amber),
  black(Colors.black);

  final Color color;

  const TileColor(this.color);
}
