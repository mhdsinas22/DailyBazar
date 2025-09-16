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

  factory NotificationModel.fromjson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json["title"],
      body: json["body"],
      image: json["image"],
      timestamp: json["timestamp"],
    );
  }
}
