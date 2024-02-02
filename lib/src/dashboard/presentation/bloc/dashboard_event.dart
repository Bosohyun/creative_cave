part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class TabChange extends DashboardEvent {
  final int tabIndex;

  const TabChange(this.tabIndex);

  @override
  List<Object> get props => [tabIndex];
}
