import 'package:fake_json/presentation/bloc/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_loading_list/lazy_loading_list.dart';

import '../../data/models/users_model/user.dart';
import '../bloc/bloc/user_bloc_bloc.dart';
import '../widgets/user_card.dart';

class UserSearch extends SearchDelegate {
  SearchBloc searchBloc;
  UserSearch({required this.searchBloc});
  late String queryString;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    queryString = query;
    searchBloc.add(GetSearchData(keyword: query));
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return buildLoading();
        } else if (state is SearchLoading) {
          return buildLoading();
        } else if (state is SearchLoaded) {
          if (state.search.isEmpty) {
            return Center(
              child: Text('No Result Found'),
            );
          }
          return cardlist(context, state.search);
        } else if (state is SearchError) {
          return Container();
        } else {
          return Container();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  Widget buildLoading() => const Center(child: CircularProgressIndicator());

  Widget cardlist(BuildContext context, List<User?> model) {
    return SizedBox(
        child: ListView.builder(
      itemCount: model.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: ((context, index) {
        final users = model[index];
        return LazyLoadingList(
          index: index,
          initialSizeOfItems: 10,
          loadMore: () => print('Loading More'),
          hasMore: true,
          child: UserListCard(
            users!,
          ),
        );
      }),
    ));
  }
}
