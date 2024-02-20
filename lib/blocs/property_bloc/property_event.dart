part of 'property_bloc.dart';

@immutable
sealed class PropertyEvent {}

class LoadPropertiesEvent extends PropertyEvent {}

class ApprovePropertyEvent extends PropertyEvent {
  final String PropertyId;
  ApprovePropertyEvent({required this.PropertyId});
}
