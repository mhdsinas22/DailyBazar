import 'dart:convert';

import 'package:bording_week1/data/models/notification_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("NotificationModel Tests", () {
    test('JSON parsing works correctly', () {
      final jsonString = '''{
        "title": "Welcome",
        "body": "This is your first notification",
        "image": "https://example.com/img.png",
        "timestamp":"2025-09-16 10:00:00"
    }''';
      final Map<String, dynamic> jsonmap = jsonDecode(jsonString);
      final model = NotificationModel.fromjson(jsonmap);
      expect(model.title, "Welcome");
      expect(model.body, "This is your first notification");
      expect(model.image, "https://example.com/img.png");
      expect(model.timestamp, "2025-09-16 10:00:00");
    });
  });
  test('Empty fields handled correctly', () {
    final jsonMap = {"title": "", "body": "", "image": "", "timestamp": ""};

    final model = NotificationModel.fromjson(jsonMap);

    expect(model.title, "");
    expect(model.body, "");
    expect(model.image, "");
    expect(model.timestamp, "");
  });

  test('Different data works correctly', () {
    final jsonMap = {
      "title": "Alert",
      "body": "Battery low",
      "image": "https://example.com/alert.png",
      "timestamp": "2025-09-16 12:30:00",
    };

    final model = NotificationModel.fromjson(jsonMap);

    expect(model.title, "Alert");
    expect(model.body, "Battery low");
    expect(model.image, "https://example.com/alert.png");
    expect(model.timestamp, "2025-09-16 12:30:00");
  });
}
