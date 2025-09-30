import 'dart:convert';
import 'dart:isolate';

import 'package:bording_week1/data/models/notification_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String url =
      "https://raw.githubusercontent.com/sayanp23/test-api/main/test-notifications.json";

  /// Fetch notifications from the API with full status code handling
  Future<List<NotificationModel>> fetchNotifications() async {
    try {
      final response = await http.get(Uri.parse(url));

      // Handle different HTTP status codes
      switch (response.statusCode) {
        case 200:
          // Success: parse JSON
          final result = await Isolate.run(() => jsonDecode(response.body));

          if (result is Map<String, dynamic> && result.containsKey('data')) {
            final data = result['data'];
            if (data is List) {
              return data
                  .map((json) => NotificationModel.fromJson(json))
                  .toList();
            } else {
              throw FormatException("Expected 'data' to be a List");
            }
          } else {
            throw FormatException("Unexpected JSON format");
          }

        case 400:
          throw HttpException(
            "Bad Request (400): The server could not understand the request.",
          );
        case 401:
          throw HttpException(
            "Unauthorized (401): Access is denied due to invalid credentials.",
          );
        case 403:
          throw HttpException(
            "Forbidden (403): You don't have permission to access this resource.",
          );
        case 404:
          throw HttpException(
            "Not Found (404): The requested resource could not be found.",
          );
        case 500:
          throw HttpException(
            "Internal Server Error (500): The server encountered an error.",
          );
        case 503:
          throw HttpException(
            "Service Unavailable (503): The server is currently unavailable.",
          );
        default:
          throw HttpException(
            "Unexpected HTTP status code: ${response.statusCode}",
          );
      }
    } on http.ClientException catch (e) {
      throw Exception("HTTP Client Error: ${e.message}");
    } on FormatException catch (e) {
      throw Exception("Data format error: ${e.message}");
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }
}

/// Custom exception for HTTP errors
class HttpException implements Exception {
  final String message;
  HttpException(this.message);

  @override
  String toString() => message;
}
