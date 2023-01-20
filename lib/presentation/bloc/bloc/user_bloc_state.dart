part of 'user_bloc_bloc.dart';

abstract class UserBlocState extends Equatable {
  const UserBlocState();

  @override
  List<Object> get props => [];
}

class UserBlocInitial extends UserBlocState {}

class UserBlocLoading extends UserBlocState {}

class UserBlocLoaded extends UserBlocState {
  final List<UsersModel?> usersModel;

  const UserBlocLoaded(this.usersModel);
}

class UserBlocError extends UserBlocState {
  final String message;

  const UserBlocError(this.message);
}
