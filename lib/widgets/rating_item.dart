import 'package:cozy/theme.dart';
import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final int rating;
  RatingItem(this.rating);

  @override
  Widget build(BuildContext context) {
    List<Image> star = [];
    for (var i = 1; i <= 5; i++) {
      star.add(Image.asset(
        'assets/images/Icon_star_solid.png',
        width: 20,
        color: i <= rating ? accentColor : greyColor,
      ));
    }
    return Container(
      child: Row(
        children: star.map((item) {
          return Container(
            margin: EdgeInsets.only(right: 2),
            child: item,
          );
        }).toList(),
      ),
    );
  }
}
