part of 'dashboard_bloc.dart';

sealed class DashboardState extends Equatable {
  const DashboardState({required this.tabIndex});

  final int tabIndex;

  @override
  List<Object> get props => [];
}

final class DashboardInitial extends DashboardState {
  const DashboardInitial({required super.tabIndex});
}
