import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_informations/control/home_control/home_cubit.dart';

class PlantImage extends StatelessWidget {
  const PlantImage ({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    HomeCubit controller = context.read<HomeCubit>();
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        width: .35.sw,
        height: .23.sh,
        imageUrl: controller
            .plants[index].imageUrl!,
        placeholder: (context, url) =>
            Image.asset(
              'assets/image/placeholder.png',
              fit: BoxFit.fill,
            ),
        errorWidget:
            (context, url, error) =>
        const Icon(Icons.error),
      ),
    );
  }
}
