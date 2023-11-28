import 'package:cached_network_image/cached_network_image.dart';
import 'package:cozy/models/space.dart';
import 'package:cozy/pages/error_page.dart';
import 'package:cozy/providers/detail_provider.dart';
import 'package:cozy/theme.dart';
import 'package:cozy/widgets/facility_item.dart';
import 'package:cozy/widgets/photo_item.dart';
import 'package:cozy/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cool_alert/cool_alert.dart';

class DetailPage extends StatelessWidget {
  final Space space;
  DetailPage(this.space);

  @override
  Widget build(BuildContext context) {
    bool _isFavorited;

    launchURL(String url) async =>
        await canLaunch(url) ? await launch(url) : Navigator.push(context, MaterialPageRoute(builder: (context) => ErrorPage()));

    showConfirm() {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.confirm,
        text: "Apa kamu yakin ingin menghubungi pemilik kos ?",
        confirmBtnText: "Hubungi",
        cancelBtnText: "Batal",
        onConfirmBtnTap: () => launchURL('tel:+${space.phone}'),
        confirmBtnColor: primaryColor,
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: space.imageUrl!,
              height: 350,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: edge, vertical: 30),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                space.name!,
                                style: blackTextStyle.copyWith(fontSize: 22),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text.rich(
                                TextSpan(
                                  text: '\$${space.price}',
                                  style: purpleTextStyle.copyWith(
                                    fontSize: 16,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ' / month',
                                      style: greyTextStyle.copyWith(
                                        fontSize: 16,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          RatingItem(space.rating)
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Main Facilities',
                        style: blackTextStyle.copyWith(fontSize: 16),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FacilityItem(
                            imageUrl: 'assets/images/icon_kitchen.png',
                            name: 'kitchen',
                            sum: space.numberOfKitchens,
                          ),
                          FacilityItem(
                            imageUrl: 'assets/images/icon_bedroom.png',
                            name: 'bedroom',
                            sum: space.numberOfBedrooms,
                          ),
                          FacilityItem(
                            imageUrl: 'assets/images/icon_lemari.png',
                            name: 'big cupboards',
                            sum: space.numberOfCupboards,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Photos',
                        style: blackTextStyle.copyWith(fontSize: 16),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: space.photos!.map((item) {
                            return Container(
                              margin: EdgeInsets.only(right: 18),
                              child: PhotoItem(item),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Location',
                        style: blackTextStyle.copyWith(fontSize: 16),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${space.address}\n${space.city}',
                            style: greyTextStyle,
                          ),
                          InkWell(
                            onTap: () {
                              launchURL(space.mapUrl!);
                            },
                            child: Image.asset(
                              'assets/images/btn_map.png',
                              width: 40,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - (2 * edge),
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            showConfirm();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17.0),
                            ),
                          ),
                          child: Text(
                            'Book Now',
                            style: whiteTextStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge, vertical: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Image.asset('assets/images/btn_back.png', width: 40),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Consumer<DetailProvider>(
                    builder: (context, provider, child) {
                      _isFavorited = provider.getIsFavorited;
                      return InkWell(
                        onTap: () {
                          provider.setIsfavorited(!_isFavorited);
                        },
                        child: Image.asset(
                          _isFavorited ? 'assets/images/btn_wishlist_active.png' : 'assets/images/btn_wishlist.png',
                          width: 40,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
