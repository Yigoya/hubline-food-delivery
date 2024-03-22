class Restaurant {
  int id;
  String name;
  String description;
  double rating;
  double longitude;
  double latitude;
  String imagename;
  Restaurant(
      {required this.id,
      required this.name,
      required this.rating,
      required this.latitude,
      required this.longitude,
      required this.imagename,
      required this.description});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'rating': rating,
      'latitude': latitude,
      'longitude': longitude,
      'description': description,
      'imagename': imagename,
    };
  }

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
        id: map['id'],
        name: map['name'],
        rating: map['rating'],
        latitude: map['latitude'],
        longitude: map['longitude'],
        imagename: map['imagename'],
        description: map['description']);
  }
}
