class NotificationModel {
  final String title;
  final String body;
  final String image;
  final String timestamp;

  NotificationModel({
    required this.title,
    required this.body,
    required this.image,
    required this.timestamp,
  });

  // Corrected factory constructor name and added null safety
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json["title"] ?? "", // If null, use empty string
      body: json["body"] ?? "",
      image: json["image"] ?? "",
      timestamp: json["timestamp"] ?? "",
    );
  }
}
