import 'package:fake_json/data/models/users_model/profile.dart';
import 'package:fake_json/data/models/users_model/user.dart';
import 'package:fake_json/data/models/users_model/users_model.dart';
import 'package:fake_json/presentation/pages/profile.dart';
import 'package:fake_json/presentation/widgets/theme.dart';
import 'package:flutter/material.dart';

class UserListCard extends StatelessWidget {
  final User user;

  const UserListCard(
    this.user, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfilePage(
                  about: user.about!,
                  company: user.company!,
                  name: user.profile!.name!,
                  gender: user.profile!.gender!,
                  contact: user.profile!.phone!,
                  address: user.profile!.address!,
                  image: user.profile!.picture!),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xff101828).withOpacity(0.1),
                spreadRadius: -4,
                blurRadius: 16,
                offset: Offset(0, 12), // changes position of shadow
              ),
            ],
          ),
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12)),
                        child: SizedBox(
                          width: 70,
                          child: Image.network(
                            user.profile!.picture!,
                            width: 80,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(user.profile!.name!,
                                overflow: TextOverflow.ellipsis,
                                style: trueBlackTextStyle.copyWith(
                                    fontSize: 12, fontWeight: semiBold)),
                            Text(user.company!,
                                overflow: TextOverflow.ellipsis,
                                style: trueBlackTextStyle.copyWith(
                                    fontSize: 10, fontWeight: reguler)),
                            Text(user.profile!.phone!,
                                overflow: TextOverflow.ellipsis,
                                style: trueBlackTextStyle.copyWith(
                                    fontSize: 10, fontWeight: reguler)),
                            Text(user.profile!.address!,
                                overflow: TextOverflow.ellipsis,
                                style: trueBlackTextStyle.copyWith(
                                    fontSize: 10, fontWeight: reguler)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
