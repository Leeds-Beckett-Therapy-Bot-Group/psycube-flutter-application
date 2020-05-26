import 'package:firebase_database/firebase_database.dart';
import 'happiness.dart';
import "dart:async";

class DBHandler {
  //this string is populated from the state.
  String uid;
  //create an instance of the dataabase
  final _database = FirebaseDatabase.instance;

  DBHandler(this.uid);

  //writes the happiness to the database
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

  //reads from the database using the users uid, so users can only access their own data
  Future<List<Happiness>> readHappiness() async {
    DataSnapshot snapshots =
        await _database.reference().child("$uid/feelings").once();

    //not sure what this does but something to do with setting the happiness into a hashmap i think lol
    var entries = snapshots.value.entries
        .map((MapEntry mapEntry) => Happiness.fromMapEntry(mapEntry));

    List<Happiness> listOfHappiness = List.from(entries);
    listOfHappiness.sort(this._sortHappinessByTime);
    return listOfHappiness;
  }

  //gives the happiness a time stamp, so it can be queried from firebase to be used by the charts.
  int _sortHappinessByTime(Happiness feelingOne, Happiness feelingTwo) =>
      feelingOne.time.millisecondsSinceEpoch >
              feelingTwo.time.millisecondsSinceEpoch
          ? 1
          : -1;
}
