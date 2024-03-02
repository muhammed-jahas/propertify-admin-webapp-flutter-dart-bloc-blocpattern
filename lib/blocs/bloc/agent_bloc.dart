import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:propertify_webapp/data/exceptions/app_exceptions.dart';
import 'package:propertify_webapp/repositories/agent_repo.dart';

import '../../models/agent_model.dart';

part 'agent_event.dart';
part 'agent_state.dart';

class AgentBloc extends Bloc<AgentEvent, AgentState> {
  AgentBloc() : super(AgentInitial()) {
    on<AgentEvent>(loaddAgents);
  }

  FutureOr<void> loaddAgents(event, emit) async {
    debugPrint('Start Load Agents');
    emit(AgentLoadingState());
    Future.delayed(Duration(seconds: 2));
    final response = await AgentRepo().getAllAgents();
    if (response.data != null) {
      if (response.data['status'] == 'success') {
        final agents = (response.data['agents'] as List)
            .map((json) => AgentModel.fromJson(json))
            .toList();
        debugPrint('$agents');
        print(agents);
        emit(AgentLoadSuccessState(
          agents: agents,
        ));
      } else if (response.appexception != null) {
        emit(AgentsLoadErrorState(exception: response.appexception));
      }
    }
  }
}
