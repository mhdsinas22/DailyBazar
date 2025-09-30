import 'package:flutter/material.dart';

/// Utility class for TextFormField styling
/// Provides reusable InputBorder styles for enabled and focused states.
class Textformfiledfunction {
  /// Returns the InputBorder for an enabled (unfocused) TextFormField
  static InputBorder enableborder() {
    return OutlineInputBorder(
      borderSide: BorderSide.none, // No visible border
      borderRadius: BorderRadius.circular(10), // Rounded corners
    );
  }
  /// Returns the InputBorder for a focused TextFormField
  static InputBorder focusedBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide.none, // No visible border when focused
      borderRadius: BorderRadius.circular(10), // Rounded corners
    );
  }
}
