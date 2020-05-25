import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'happiness.dart';

class DBHandler {
  String uid;
  final _database = FirebaseDatabase.instance;

  DBHandler(this.uid);

  writeHappiness(Happiness happiness) async {
    try {
      await _database
          .reference()
          .child("$uid/feelings")
          .push()
          .set(happiness.toMap());

      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future<List<Happiness>> readHappiness() async {
    DataSnapshot snapshots =
        await _database.reference().child("$uid/feelings").once();

    var entries = snapshots.value.entries
        .map((MapEntry mapEntry) => Happiness.fromMapEntry(mapEntry));

    List<Happiness> listOfHappiness = List.from(entries);
    listOfHappiness.sort(this._sortHappinessByTime);
    return listOfHappiness;
  }

  int _sortHappinessByTime(Happiness feelingOne, Happiness feelingTwo) =>
      feelingOne.time.millisecondsSinceEpoch >
              feelingTwo.time.millisecondsSinceEpoch
          ? 1
          : -1;
}
