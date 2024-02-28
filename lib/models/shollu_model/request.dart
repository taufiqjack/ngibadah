class Request {
  String? path;
  String? year;
  String? month;
  String? date;

  Request({this.path, this.year, this.month, this.date});

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        path: json['path'] as String?,
        year: json['year'] as String?,
        month: json['month'] as String?,
        date: json['date'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'path': path,
        'year': year,
        'month': month,
        'date': date,
      };
}
