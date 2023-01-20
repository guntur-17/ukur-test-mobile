part of 'user_bloc_bloc.dart';

abstract class UserBlocEvent extends Equatable {
  const UserBlocEvent();

  @override
  List<Object> get props => [];
}

class GetUserData extends UserBlocEvent {}

class FilteredUserData extends UserBlocEvent {
  final String query;

  const FilteredUserData({required this.query});
}
