class MaptoModel {
  String? wishes, festival,image;

  MaptoModel(this.wishes, this.festival);

  factory MaptoModel.festival(Map festival) {
    MaptoModel m1 = MaptoModel(festival['wishes'], festival['festival']);
    return m1;
  }
}