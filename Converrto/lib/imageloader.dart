import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'globalfunctions.dart';

class ImageLoader extends StatelessWidget {
  const ImageLoader({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return url.toLowerCase().endsWith('.svg')
        ? (isNetworkUrl(url)
        ? SvgPicture.network(
      url,
      fit: BoxFit.cover,
    )
        : SvgPicture.asset(
      url,
      fit: BoxFit.cover,
    ))
        : (isNetworkUrl(url)
        ? Image.network(
      url,
      fit: BoxFit.cover,
    )
        : Image.asset(
      url,
      fit: BoxFit.cover,
    ));
  }
}
