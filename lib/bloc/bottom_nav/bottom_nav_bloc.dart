import 'package:bording_week1/bloc/bottom_nav/bottom_nav_event.dart';
import 'package:bording_week1/bloc/bottom_nav/bottom_nav_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavState(selectedindex: 0)) {
    on<ChangeTabEvent>((event, emit) {
      emit(BottomNavState(selectedindex: event.index));
    });
  }
}
