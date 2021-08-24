import 'package:cozy/theme.dart';
import 'package:flutter/material.dart';

class FacilityItem extends StatelessWidget {
  final String imageUrl;
  final int sum;
  final String name;

  FacilityItem({this.imageUrl, this.name, this.sum});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Image.asset(
        imageUrl,
        width: 32,
      ),
      SizedBox(
        height: 8,
      ),
      Text.rich(
        TextSpan(
          text: sum.toString(),
          style: purpleTextStyle.copyWith(fontSize: 14),
          children: [
            TextSpan(
              text: ' $name',
              style: greyTextStyle.copyWith(fontSize: 14),
            ),
          ],
        ),
      ),
    ]);
  }
}
