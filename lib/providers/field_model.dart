class FieldModel {
  final String id;
  final String name;
  final String town;
  final int capacity;
  final int price;
  final Locate location;
  final String owner;
  final int phoneNumber;
  final bool isOpen;
  final String info;

  FieldModel({
    required this.id,
    required this.name,
    required this.town,
    required this.capacity,
    required this.location,
    required this.price,
    required this.owner,
    required this.phoneNumber,
    required this.isOpen,
    required this.info,
  });

  factory FieldModel.fromJson(String key, Map<String, dynamic> json) {
    return FieldModel(
      id: key,
      name: json['Name'],
      town: json['Town'],
      capacity: json['Capacity'],
      price: json['Price'],
      owner: json['Owner'],
      phoneNumber: json['PhoneNumber'],
      isOpen: json['IsOpen'],
      info: json['Info'],
      location: Locate.fromMap(
        [
          json['Latitude'],
          json['Longitude'],
        ],
      ),
    );
  }
}

class Locate {
  final latitude;
  final longitude;

  Locate(this.latitude, this.longitude);

  factory Locate.fromMap(List locMap) {
    return Locate(locMap[0], locMap[1]);
  }
}
