import 'package:flutter/material.dart';
import 'package:plants_informations/core/utils/app_colors.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(color: AppColors.defaultColor,),);
  }
}
