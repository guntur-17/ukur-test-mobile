import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fake_json/data/models/users_model/user.dart';
import 'package:fake_json/data/repositories/search_repositories.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository searchRepos;
  SearchBloc({required this.searchRepos}) : super(SearchInitial()) {
    on<GetSearchData>((event, emit) async {
      emit(SearchLoading());
      try {
        final searchData = await searchRepos.getDataList(query: event.keyword);
        emit(SearchLoaded(searchData!));
      } catch (e) {
        emit(const SearchError('Not Found'));
      }
    });
  }
}
