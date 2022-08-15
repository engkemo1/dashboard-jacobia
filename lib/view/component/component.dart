import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget imageFromNetwork(
    {required String url,
      fit = BoxFit.cover,
      }) {
  return CachedNetworkImage(
    imageUrl: url,
    placeholder: (context, url) =>
    const Center(child: CircularProgressIndicator()),
    errorWidget: (context, url, error) => const Icon(Icons.error),
    fit: fit,

  );
}