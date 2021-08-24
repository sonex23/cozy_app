import 'package:cozy/models/space.dart';
import 'package:cozy/pages/detail_page.dart';
import 'package:flutter/material.dart';
import '../theme.dart';

class SpaceCard extends StatelessWidget {
  final Space space;
  SpaceCard(this.space);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailPage(space)));
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Container(
                width: 130,
                height: 110,
                child: Stack(
                  children: [
                    Image.network(
                      space.imageUrl,
                      width: 130,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(36),
                          ),
                        ),
                        width: 70,
                        height: 30,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/Icon_star_solid.png',
                                width: 22,
                                height: 22,
                              ),
                              Text(
                                '${space.rating}/5',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  space.name,
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '\$${space.price}',
                      style: purpleTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      ' / month',
                      style: greyTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 16,
                ),
                Text(
                  '${space.city}, ${space.country}',
                  style: greyTextStyle.copyWith(fontSize: 16),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
