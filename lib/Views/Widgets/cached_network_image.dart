import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget cachedNetworkImage(String imageUrl, {double? width, BoxFit? fit, double? height}) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    fit: fit ?? BoxFit.fill,
    width: width,
    height: height,
    progressIndicatorBuilder: (context, url, downloadProgress) => Align(
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          value: downloadProgress.progress,
          color: Colors.blue,
        )),
    errorWidget: (context, url, error) =>
        const Align(alignment: Alignment.center, child: Icon(Icons.error, color: Colors.black26,)),
  );
}
