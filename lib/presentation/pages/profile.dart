import 'package:fake_json/presentation/widgets/profile.dart';
import 'package:fake_json/presentation/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String gender;
  final String contact;
  final String address;
  final String about;
  final String company;
  final String image;
  const ProfilePage(
      {Key? key,
      required this.name,
      required this.gender,
      required this.contact,
      required this.address,
      required this.image,
      required this.about,
      required this.company})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              // mainAxisAlignment: ,
              children: [
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: trueWhite,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Profil',
                  softWrap: true,
                  style: whiteTextStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12)),
              child: SizedBox(
                width: 120,
                child: Image.network(
                  image,
                  width: 80,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget body() {
      return Container(
        height: MediaQuery.of(context).size.height * 0.7,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileCard(title: 'Full Name', content: name),
              ProfileCard(title: 'Company', content: company),
              ProfileCard(title: 'Gender', content: gender),
              ProfileCard(title: 'Phone', content: contact),
              ProfileCard(title: 'Address', content: address),
              ProfileCard(title: 'About', content: about),
            ]),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Container(
                color: Colors.blue,
                child: Column(
                  children: <Widget>[
                    header(),
                    body()
                    // body(),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
