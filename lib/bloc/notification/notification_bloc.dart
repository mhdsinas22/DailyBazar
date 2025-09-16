import 'package:bording_week1/bloc/notification/notification_event.dart';
import 'package:bording_week1/bloc/notification/notification_state.dart';
import 'package:bording_week1/data/services/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final ApiService apiService;
  NotificationBloc(this.apiService) : super(NotificationInitial()) {
    on<FetchNotifications>((event, emit) async {
      emit(NotificationLoading());
      try {
        final notifications = await apiService.fetchNotifications();
        emit(NotificationLoaded(notifications));
      } catch (e) {
        emit(NotificationError(e.toString()));
      }
    });
  }
}
