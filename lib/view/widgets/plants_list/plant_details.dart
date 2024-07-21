import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../control/home_control/home_cubit.dart';
import '../../../core/utils/app_text_styles.dart';

class PlantDetails extends StatelessWidget {
  const PlantDetails({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    HomeCubit controller = context.read<HomeCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: .44.sw,
          child: Text(
            controller.plants[index].commonName!,
            style: AppTextStyles.text16BlackTextStyle,
            maxLines: 2,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Text(
            controller.plants[index].year! == -1
                ? 'NA'
                : controller.plants[index].year.toString(),
            style: AppTextStyles.text16BlackTextStyle,
          ),
        ),
        Text(
          controller.plants[index].status!,
          style: AppTextStyles.text16BlackTextStyle,
        ),
      ],
    );
  }
}
