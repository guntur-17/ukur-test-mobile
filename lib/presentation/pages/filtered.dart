import 'package:fake_json/data/models/users_model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/theme.dart';
import '../widgets/user_card.dart';

class FilteredPage extends StatefulWidget {
  final List<User>? filtered;
  const FilteredPage({super.key, this.filtered});

  @override
  State<FilteredPage> createState() => _FilteredPageState();
}

class _FilteredPageState extends State<FilteredPage> {
  @override
  Widget build(BuildContext context) {
    Widget cardlist() {
      return SizedBox(
          child: ListView.builder(
        itemCount: widget.filtered!.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: ((context, index) {
          final users = widget.filtered![index];
          return UserListCard(
            users,
          );
        }),
      ));
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
                    cardlist(),
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
        appBar: AppBar(),
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
}
