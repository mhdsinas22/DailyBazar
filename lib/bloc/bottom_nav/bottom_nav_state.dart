import 'package:equatable/equatable.dart';

class BottomNavState extends Equatable {
  final int selectedindex;
const  BottomNavState({required this.selectedindex});
  @override
  List<Object?> get props => [selectedindex];
}
