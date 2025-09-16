import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class NotificationEvent extends Equatable {
  @override
  List<Widget?> get props => [];
}

class FetchNotifications extends NotificationEvent {}
