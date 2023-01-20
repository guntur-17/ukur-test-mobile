import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fake_json/data/data.dart';
import 'package:fake_json/data/models/users_model/users_model.dart';

part 'user_bloc_event.dart';
part 'user_bloc_state.dart';

class UserBlocBloc extends Bloc<UserBlocEvent, UserBlocState> {
  final UserRepository userRepos;
  UserBlocBloc({required this.userRepos}) : super(UserBlocInitial()) {
    on<UserBlocEvent>((event, emit) async {
      emit(UserBlocLoading());
      try {
        final userData = await userRepos.getDataList();
        emit(UserBlocLoaded(userData!));
      } catch (e) {
        emit(const UserBlocError('Data is Null'));
      }
    });
  }
}
