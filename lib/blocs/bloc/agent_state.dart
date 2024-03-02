part of 'agent_bloc.dart';

@immutable
sealed class AgentState {}

final class AgentInitial extends AgentState {}


final class AgentLoadingState extends AgentState {}

final class AgentLoadSuccessState extends AgentState {
  final List<AgentModel>? agents;
  AgentLoadSuccessState({this.agents});
}

final class AgentsLoadErrorState extends AgentState {
  final AppException? exception;

  AgentsLoadErrorState({this.exception});
}
