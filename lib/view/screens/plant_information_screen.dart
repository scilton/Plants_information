import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_informations/control/plant_details_control/plant_information_cubit.dart';
import 'package:plants_informations/core/components/custom_button.dart';
import 'package:plants_informations/core/utils/app_colors.dart';
import 'package:plants_informations/core/utils/app_constants.dart';
import 'package:plants_informations/core/utils/app_strings.dart';
import 'package:plants_informations/model/plants_model.dart';
import 'package:plants_informations/view/widgets/custom_app_bar.dart';
import 'package:plants_informations/view/widgets/plant_information/image.dart';
import 'package:plants_informations/view/widgets/plant_information/information.dart';

class PlantInformationScreen extends StatelessWidget {
  const PlantInformationScreen({super.key, required this.plant});

  final Plant plant;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlantInformationCubit(),
      child: BlocConsumer<PlantInformationCubit, PlantInformationState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: customAppBar(context,
                title: AppStrings.plantInformationAppbarTitle,
                backButton: true),
            body: Padding(
              padding: const EdgeInsets.all(AppConstants.bodyPadding),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        PlantInformationImage(imageUrl: plant.imageUrl!),
                    SizedBox(height: 10.h),
                    PlantInformationWidget(plant: plant),
                    SizedBox(height: 20.h),
                      ],
                    ),
                    CustomButton(
                      width: .95.sw,
                      height: 50.h,
                      text: AppStrings.moreDetails,
                      backgroundColor: AppColors.defaultColor,
                      textColor: AppColors.buttonTextColor,
                      textWeight: FontWeight.bold,
                      textSize: 16.sp,
                      function: () {
                        PlantInformationCubit controller = context.read<
                            PlantInformationCubit>();
                        controller.goToLink(
                            '${AppConstants.wikipediaUrl}/${plant
                                .scientificName}');
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
