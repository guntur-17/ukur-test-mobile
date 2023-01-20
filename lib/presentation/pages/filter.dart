import 'package:fake_json/presentation/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../data/models/users_model/user.dart';

class FilterPage extends StatelessWidget {
  final List<User> user;
  const FilterPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    List<String> gender = [];
    for (var element in user) {
      gender.add(element.profile!.gender.toString());
    }
    List distinctGender = [
      ...{...gender}
    ];

    List<String> status = [];
    for (var element in user) {
      status.add(element.isActive.toString());
    }
    List distinctStatus = [
      ...{...status}
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.84,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      filter(title: 'Gender', data: distinctGender),
                    ],
                  ),
                  Row(
                    children: [
                      filter(title: 'is Active?', data: distinctStatus),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Center(
                      child: Text(
                        'Apply',
                        style: whiteTextStyle.copyWith(fontSize: 14),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget filter({required String title, required List data}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            title,
            style: trueBlackTextStyle.copyWith(fontSize: 20),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                height: 50,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        height: 70,
                        width: 90,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: grey),
                            color: trueWhite,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                            child: Text(
                          '${data[index]}',
                          style: TextStyle(fontSize: 14),
                        )),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
