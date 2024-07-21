part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeFilterChanged extends HomeState {}

final class GetPlantLoading extends HomeState {}

final class GetPlantSuccess extends HomeState {}

final class GetPlantError extends HomeState {
  final String error;

  GetPlantError(this.error);
}

final class GetZonePlantLoading extends HomeState {}

final class GetZonePlantSuccess extends HomeState {}

final class GetZonePlantError extends HomeState {
  final String error;

  GetZonePlantError(this.error);
}
