part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeResult extends HomeState {
  final bool madeWithFlutter;
  final String applicationName;
  final Uint8List? appIconBytes;

  HomeResult({
    required this.madeWithFlutter,
    required this.applicationName,
    this.appIconBytes,
  });
}
