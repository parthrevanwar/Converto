import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({super.key, required this.radius, required this.url});
  final  double radius;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius*2,
      width: radius*2,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: url.toLowerCase().endsWith('.svg')?SvgPicture.asset(
        url,
        fit: BoxFit.cover,
      ):ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Image.asset(
          url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
