import 'package:dot_cast/dot_cast.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:school_application/game/tile.dart';
import 'package:school_application/user.dart';

class GameManager {
  static final int cardAtStart = 14;

  GameManager({required this.gameID, required this.gameName, required this.tiles, required this.players}) {
    currentPlayer = players.first;
    stock.addAll(tiles);
    for (int i = 0; i < players.length; i++) {
      players[i].tiles.addAll(tiles.getRange(i, i+cardAtStart));
      stock.removeRange(0, cardAtStart);
    }
    gameMap = GameMap();
    sendData();

    listenToTurn();
  }

  void sendData() async {
    final ref = FirebaseDatabase.instance.ref("games/$gameID");
    await ref.set({
      "id": gameID,
      "title": gameName,
      "tiles": tiles.map<Map<String, dynamic>>((tile) => tile.toJson()),
      "players": players.map<Map<String, dynamic>>((e) => e.toJson()),
      "currentPlayer": currentPlayer.user.uid,
      "currentPlayerNum": players.indexOf(currentPlayer),
      "stock": stock.map<Map<String, dynamic>>((e) => e.toJson(),),
      "gameMap": gameMap.toJson(),
    });
  }

  GameManager.fromJson({required this.gameID}) {
    getData(gameID);
  }

  void getData(String gameID) async {
    final ref = FirebaseDatabase.instance.ref("games/$gameID");
    var event = await ref.child("title").once();
    gameName = tryCast(event.snapshot.value) ?? '';
    event = await ref.child("players").once();
    final List<Object> playersList = tryCast(event.snapshot.value) ?? [];
    for (var player in playersList) {
      players.add(Player.fromJson(json: tryCast(player) ?? {}));
    }
    event = await ref.child("currentPlayerNum").once();
    currentPlayer = players[tryCast(event.snapshot.value) ?? 0];
    event = await ref.child("tiles").once();
    final List<Object> tileList = tryCast(event.snapshot.value) ?? [];
    for (var tile in tileList) {
      tiles.add(Tile.fromJson(tryCast(tile) ?? {}));
    }
    event = await ref.child("stock").once();
    final List<Object> stockList = tryCast(event.snapshot.value) ?? [];
    for (var tile in stockList) {
      stock.add(Tile.fromJson(tryCast(tile) ?? {}));
    }
  }

  final String gameID;
  late String gameName;
  late List<Player> players;
  late Player currentPlayer;
  late List<Tile> tiles;
  late List<Tile> stock;
  late Player myPlayer;
  late GameMap gameMap;

  List<Tile> getMyBoard() {
    return myPlayer.tiles;
  }

  List<List<Tile?>> getMap() {
    return gameMap.tiles;
  }

  bool checkMyTurn() {
    return currentPlayer == myPlayer;
  }

  void listenToTurn() {
    final ref = FirebaseDatabase.instance.ref("games/${gameID}").child("currentPlayerNum");
    ref.onValue.listen((event) {
      currentPlayer = players[event.snapshot.value as int];
    });
  }
}

class Player {
  Player({required this.user, required this.tiles});

  late User user;
  late List<Tile> tiles;
  bool hasDropped = false;

  Map<String, dynamic> toJson() {
    return {
      "uid": user.uid,
      "tiles": tiles.map<Map<String, dynamic>>((tile) => tile.toJson()),
      "hasDropped": false
    };
  }

  Player.fromJson({required Map<String, dynamic> json}) {
    user = User.getFromUid(uid: json["uid"]);
    final List<Object> tileList = tryCast(json["tiles"]) ?? [];
    tiles = [];
    for (var tile in tileList) {
      tiles.add(Tile.fromJson(tryCast(tiles) ?? {}));
    }
    hasDropped = json["hasDropped"];
  }
}

class GameMap {

  GameMap();

  late List<List<Tile?>> tiles;

  Tile? getTile(int row, int column) {
    return tiles[row][column];
  }

  void updateTile(int row, int column, Tile? tile) {
    tiles[row][column] = tile;
  }

  Map<String, dynamic> toJson() {
    return {
      "tiles": tiles.map((row) => row.map((column) => column?.toJson()),)
    };
  }

  GameMap.fromJson(Map<String, dynamic> json) {
    final List<Object> data = json["tiles"];
    for (var row in data) {
      
    }
  }
}