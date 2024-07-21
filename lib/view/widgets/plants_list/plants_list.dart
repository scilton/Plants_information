import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_informations/core/utils/app_colors.dart';
import 'package:plants_informations/view/widgets/loader.dart';
import 'package:plants_informations/view/widgets/plants_list/plant_details.dart';
import 'package:plants_informations/view/widgets/plants_list/plant_image.dart';

import '../../../control/home_control/home_cubit.dart';

class PlantsList extends StatefulWidget {
  const PlantsList({super.key});

  @override
  State<PlantsList> createState() => _PlantsListState();
}

class _PlantsListState extends State<PlantsList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _scrollListener();
    });
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<HomeCubit>().loadMorePlants();
    }
  }

  @override
  Widget build(BuildContext context) {
    HomeCubit controller = context.read<HomeCubit>();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            controller: _scrollController,
            itemBuilder: (context, index) {
              if (index < controller.plants.length) {
                return Column(
                  children: [
                    Card(
                      elevation: 10,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: index % 2 != 0
                              ? AppColors.listItemColor1
                              : AppColors.listItemColor2,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Row(children: [
                          PlantImage(index: index),
                          SizedBox(
                            width: 20.w,
                          ),
                          PlantDetails(index: index),
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                );
              } else {
                return const Loader();
              }
            },
            itemCount: controller.loadMore
                ? controller.plants.length + 1
                : controller.plants.length,
          ),
        );
      },
    );
  }
}
