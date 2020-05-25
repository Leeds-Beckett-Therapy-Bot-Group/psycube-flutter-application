class Happiness {
  String key;
  int rating;
  DateTime time;

  Happiness(this.rating) {
    this.time = DateTime.now();
  }

  Happiness.historic(this.rating, this.time);

  Happiness.fromSnapshot(String key, Map<dynamic, dynamic> data) {
    key = key;
    rating = data["rating"];
    time = DateTime.fromMillisecondsSinceEpoch(data["time"]);
  }

  Happiness.fromMapEntry(MapEntry mapEntry)
      : key = mapEntry.key,
        rating = mapEntry.value["rating"],
        time = DateTime.fromMillisecondsSinceEpoch(mapEntry.value["time"]);

  toMap() {
    return {"rating": rating, "time": time.millisecondsSinceEpoch};
  }
}