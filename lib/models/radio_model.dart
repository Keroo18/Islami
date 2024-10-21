// class RadioModel{
//   final String id;
//   final String name;
//   final String url;
//   final String recentDate;
// RadioModel({
//   required this.id,
//   required this.name,
//   required this.url,
//   required this.recentDate,
// });
// factory RadioModel.fromJson(Map<String,dynamic>json)=>RadioModel(
//     id: json["id"],
//     name: json["name"],
//     url: json["url"],
//     recentDate: json["recentDate"],
// );
// }
class RadioModel {
  final String id;
  final String name;
  final String url;
  final String recentDate;

  RadioModel({
    required this.id,
    required this.name,
    required this.url,
    required this.recentDate,
  });

  factory RadioModel.fromJson(Map<String, dynamic> json) {
    return RadioModel(
      id: json["id"]?.toString() ?? "unknown",  // Convert to String or use a default
      name: json["name"] ?? "Unnamed Radio",    // Default name if null
      url: json["url"] ?? "",                    // Default to empty string if null
      recentDate: json["recent_date"] ?? "",    // Correct key name to match API
    );
  }
}
