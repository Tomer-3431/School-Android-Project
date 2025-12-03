import 'package:dot_cast/dot_cast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:school_application/game.dart';

class User {
  late String uid;
  String name = 'Guest!';
  int elo = 0;
  List<Game> gameList = [];
  int rank = 0;

  User({
    required this.uid,
    this.name = 'Player Name',
    this.elo = 0,
    this.gameList = const [],
    this.rank = 1
  });

  User.getFromUid({
    required this.uid,
  }) {
    try {
      final ref = FirebaseDatabase.instance.ref('users/$uid');
      setData(ref);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      print('defaulted user');
      User(uid: uid);
    } on FirebaseException catch (e) {
      print(e.code);
      print('defaulted user');
      User(uid: uid);
    } catch (e) {
      print(e);
    }
  }

  User.getFromCurrent() {
    User.getFromUid(uid: FirebaseAuth.instance.currentUser!.uid);
  }

  void setData(DatabaseReference ref) async {
    var event = await ref.child('name').once();
    name = tryCast(event.snapshot.value) ?? '';
    event = await ref.child('elo').once();
    elo = tryCast(event.snapshot.value) ?? 0;
    event = await ref.child('games').once();
    final List<Object> games = tryCast(event.snapshot.value) ?? [];
    for (var game in games) {
      gameList.add(Game.fromJson(jsonData: tryCast(game) ?? {}));
    }
    event = await ref.child('rank').once();
    rank = tryCast(event.snapshot.value) ?? 1;
  }

  
}