import 'package:fake_json/data/data.dart';
import 'package:fake_json/data/repositories/search_repositories.dart';
import 'package:fake_json/presentation/bloc/bloc/search_bloc.dart';
import 'package:fake_json/presentation/bloc/bloc/user_bloc_bloc.dart';
import 'package:fake_json/presentation/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const UserApp());
}

class UserApp extends StatelessWidget {
  const UserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBlocBloc(userRepos: UserRepository()),
        ),
        BlocProvider(
          create: (context) => SearchBloc(searchRepos: SearchRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: HomePage(),
      ),
    );
  }
}
