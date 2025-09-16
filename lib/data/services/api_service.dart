import 'dart:convert';
import 'dart:isolate';

import 'package:bording_week1/data/models/notification_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String url =
      "https://raw.githubusercontent.com/sayanp23/test-api/main/test-notifications.json";

  Future<List<NotificationModel>> fetchNotifications() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final result = await Isolate.run(() => jsonDecode(response.body));

      if (result is Map<String, dynamic>) {
        final data = result["data"] as List; // 👈 data list extract
        return data.map((json) => NotificationModel.fromjson(json)).toList();
      } else {
        throw Exception("Unexpected JSON format");
      }
    } else {
      throw Exception("Failed to load notifications");
    }
  }
}
