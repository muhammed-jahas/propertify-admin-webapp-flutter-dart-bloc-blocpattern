part of 'property_bloc.dart';

@immutable
sealed class PropertyState {}

final class PropertyInitial extends PropertyState {}

final class PropertyLoadingState extends PropertyState {}

final class PropertyLoadSuccessState extends PropertyState {
  final List<PropertyModel>? properties;
  final String soldProperties;
  PropertyLoadSuccessState({this.properties,required this.soldProperties});
}

final class PropertyLoadErrorState extends PropertyState {
  final AppException? exception;

  PropertyLoadErrorState({this.exception});
}

final class PropertyApprovedSuccessState extends PropertyState {}
