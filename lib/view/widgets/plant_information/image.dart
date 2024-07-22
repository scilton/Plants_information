import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../loader.dart';

class PlantInformationImage extends StatelessWidget {
  const PlantInformationImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
  return  Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        width: .95.sw,
        height: .48.sh,
        imageUrl: imageUrl,
        placeholder: (context, url) => const Loader(),
        errorWidget: (context, url, error) => Image.asset(
          'assets/image/placeholder.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
