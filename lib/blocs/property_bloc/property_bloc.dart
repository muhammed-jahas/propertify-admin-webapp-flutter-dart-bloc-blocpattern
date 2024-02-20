import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';
import 'package:propertify_webapp/data/exceptions/app_exceptions.dart';
import 'package:propertify_webapp/models/property_model.dart';
import 'package:propertify_webapp/repositories/property_repo.dart';

part 'property_event.dart';
part 'property_state.dart';

class PropertyBloc extends Bloc<PropertyEvent, PropertyState> {
  PropertyBloc() : super(PropertyInitial()) {
    on<LoadPropertiesEvent>(loadProperties);
    on<ApprovePropertyEvent>(ApproveProperty);
  }
  List<PropertyModel> properties = [];
  String soldProperties = '0';
  FutureOr<void> loadProperties(event, emit) async {
    debugPrint('Start Load Properties');
    emit(PropertyLoadingState());
    final response = await PropertyRepo().getAllProperties();
    if (response.data != null) {
      if (response.data['status'] == 'success') {
        properties = (response.data['properties'] as List)
            .map((json) => PropertyModel.fromJson(json))
            .toList();
        debugPrint('$properties');
        soldProperties = properties
            .where((element) => element.isSold!)
            .toList()
            .length
            .toString();
        emit(PropertyLoadSuccessState(properties: properties,soldProperties: soldProperties));
      } else if (response.appexception != null) {
        emit(PropertyLoadErrorState(exception: response.appexception));
      }
    }
  }

  FutureOr<void> ApproveProperty(
      ApprovePropertyEvent event, Emitter<PropertyState> emit) async {
    debugPrint('Approving Property');
    final data = {'isApproved': true};
    final response =
        await PropertyRepo().approveProperty(data: data, id: event.PropertyId);

    if (response.data['status'] == 'success') {
      properties = properties.map((e) {
        if (e.id == event.PropertyId) {
          e.isApproved = true;
        }
        return e;
      }).toList();
      // emit(PropertyApprovedSuccessState());
      emit(PropertyLoadSuccessState(properties: properties,soldProperties: soldProperties));
    }
  }
}
