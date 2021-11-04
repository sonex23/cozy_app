import 'package:cozy/models/city.dart';
import 'package:cozy/theme.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final City city;
  // ignore: use_key_in_widget_constructors
  const CityCard(this.city);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 150,
        width: 120,
        color: const Color(0xFFF6F7F8),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  city.imageUrl!,
                  width: 120,
                  height: 102,
                  fit: BoxFit.cover,
                ),
                city.isPopular
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(36),
                            ),
                          ),
                          width: 50,
                          height: 30,
                          child: Center(
                            child: Image.asset(
                              'assets/images/Icon_star_solid.png',
                              width: 22,
                              height: 22,
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 11,
            ),
            Text(
              city.name!,
              style: blackTextStyle.copyWith(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
