class Datum {
  String? name;
  String? id;
  int? available;

  Datum({this.name, this.id, this.available});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json['name'] as String?,
        id: json['id'] as String?,
        available: json['available'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'available': available,
      };
}
