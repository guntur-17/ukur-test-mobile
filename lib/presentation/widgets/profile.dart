import 'package:flutter/material.dart';
import 'theme.dart';

class ProfileCard extends StatelessWidget {
  final String? title;
  final String? content;
  const ProfileCard({this.title, this.content, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 12.0, left: 12.0, bottom: 4.0, top: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$title',
                    style: trueBlackTextStyle.copyWith(
                        fontSize: 14, fontWeight: bold),
                  ),
                  const SizedBox(width: 40),
                  Flexible(
                    child: Text(
                      '$content',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 15,
                    ),
                  ),
                ],
              ),
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
