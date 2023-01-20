part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class GetSearchData extends SearchEvent {
  final String keyword;

  const GetSearchData({required this.keyword});
}
