import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_informations/model/plants_model.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/utils/app_text_styles.dart';

class PlantInformationWidget extends StatelessWidget {
  const PlantInformationWidget({super.key, required this.plant});
final Plant plant;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            AppStrings.plantNameKey + plant.commonName!,
            style: AppTextStyles.text16BlackTextStyle,
            maxLines: 2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Text(
              AppStrings.plantFamilyKey + plant.family!,
              style: AppTextStyles.text16BlackTextStyle,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.plantIndexKey,
                style: AppTextStyles.text16BlackTextStyle,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                '${plant.bibliography}\n${plant.scientificName}',
                style: AppTextStyles.text16BlackTextStyle,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: Text(
              AppStrings.plantAuthorKey + plant.author!,
              style: AppTextStyles.text16BlackTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
