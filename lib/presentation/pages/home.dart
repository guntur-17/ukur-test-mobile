import 'package:fake_json/data/data.dart';
import 'package:fake_json/data/models/users_model/user.dart';
import 'package:fake_json/data/models/users_model/users_model.dart';
import 'package:fake_json/presentation/bloc/bloc/search_bloc.dart';
import 'package:fake_json/presentation/bloc/bloc/user_bloc_bloc.dart';
import 'package:fake_json/presentation/pages/filter.dart';
import 'package:fake_json/presentation/pages/search.dart';
import 'package:fake_json/presentation/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_loading_list/lazy_loading_list.dart';

import '../widgets/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserBlocBloc userBloc;
  late List<UsersModel?> _allData;

  @override
  void initState() {
    userBloc = BlocProvider.of<UserBlocBloc>(context);
    userBloc.add(GetUserData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget cardlist(BuildContext context, List<UsersModel?> model) {
      final List<User> allData = model.first!.data!.users!;
      return SizedBox(
          child: ListView.builder(
        itemCount: allData.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: ((context, index) {
          final users = allData[index];
          return LazyLoadingList(
            index: index,
            initialSizeOfItems: 10,
            loadMore: () => print('Loading More'),
            hasMore: true,
            child: UserListCard(
              users,
            ),
          );
        }),
      ));
    }

    Widget buildBody() {
      return BlocListener<UserBlocBloc, UserBlocState>(
        listener: (context, state) {
          if (state is UserBlocError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        child: BlocBuilder<UserBlocBloc, UserBlocState>(
          builder: (context, state) {
            if (state is UserBlocInitial) {
              return buildLoading();
            } else if (state is UserBlocLoading) {
              return buildLoading();
            } else if (state is UserBlocLoaded) {
              Future.delayed(Duration.zero, () async {
                setState(() {
                  _allData = state.usersModel;
                });
              });
              return cardlist(context, state.usersModel);
            } else if (state is UserBlocError) {
              return Container();
            } else {
              return Container();
            }
          },
        ),
      );
    }

    Widget body() {
      return Center(
        child: SizedBox(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: MediaQuery.of(context).size.width * 0.95,
                child: Column(
                  children: [
                    // searchbar(),
                    // filtercard(),
                    buildBody(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          FilterPage(user: _allData.first!.data!.users!),
                    ));
              },
              child: Icon(Icons.filter_list)),
          actions: [
            InkWell(
              onTap: () {
                showSearch(
                    context: context,
                    delegate: UserSearch(
                        searchBloc: BlocProvider.of<SearchBloc>(context)));
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Icon(Icons.search),
              ),
            )
          ],
        ),
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // header(),
              body(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLoading() => const Center(child: CircularProgressIndicator());
}
