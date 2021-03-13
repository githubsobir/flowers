part of 'main_bloc.dart';

@immutable
abstract class MainState {}

class LoadingState extends MainState {}
class SuccessState extends MainState {
 final String mainData;
  SuccessState({this.mainData});

}
class FailState extends MainState {
  final String message;
  FailState({this.message});

}
