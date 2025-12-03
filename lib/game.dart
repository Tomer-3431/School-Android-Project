import 'package:dot_cast/dot_cast.dart';

class Game {
  late GameState gameState;
  late double eloModification;
  late List<String> players;

  Game({
    required this.gameState,
    required this.eloModification,
    required this.players
  });


  Game.fromJson({
    required Map<String, dynamic> jsonData
  }) {
    gameState = GameState.values.elementAt(tryCast(jsonData['gameState']) ?? 2);
    eloModification = tryCast(jsonData['eloModification']) ?? 0;
    players = tryCast(jsonData['players']) ?? [];
  }

  Map<String, dynamic> toJson() {
    return {
      'gameState': gameState.index,
      'eloModification': eloModification,
      'players': players.toList(),
    };
  }
}

enum GameState { WIN, LOSE, TIE }
