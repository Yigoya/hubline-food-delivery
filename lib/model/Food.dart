class Food {
  int id;
  String name;
  int restaurantid;
  // double rating;
  int catagory;
  String? imagename;
  Food(
      {required this.id,
      required this.name,
      required this.imagename,
      required this.catagory,
      required this.restaurantid});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'restaurantid': restaurantid,
      'catagory': catagory,
      'imagename': imagename,
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
        id: map['id'],
        name: map['name'],
        imagename: map['imagename'],
        catagory: map['catagory'],
        restaurantid: map['restaurantid']);
  }
}
