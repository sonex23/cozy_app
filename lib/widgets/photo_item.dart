import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PhotoItem extends StatelessWidget {
  final String imageUrl;
  PhotoItem(this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: 88,
        width: 110,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => Image.asset('assets/images/photo2.png'),
        errorListener: (value) => print(value.toString()),
      ),
    );
  }
}
