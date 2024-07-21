import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:plants_informations/control/home_control/home_cubit.dart';
import 'package:plants_informations/core/utils/app_constants.dart';
import 'package:plants_informations/core/utils/app_strings.dart';
import 'package:plants_informations/view/widgets/connection_error.dart';
import 'package:plants_informations/view/widgets/custom_app_bar.dart';
import 'package:plants_informations/view/widgets/loader.dart';
import 'package:plants_informations/view/widgets/plants_list/plants_list.dart';

import '../widgets/filter_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getAllPlants(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit controller = context.read<HomeCubit>();
          return Scaffold(
            appBar: customAppBar(context, title: AppStrings.appTitle),
            body: StreamBuilder(
                stream: controller.connection.onStatusChange,
                builder: (context, snapshot) {
                  if (snapshot.data == InternetConnectionStatus.disconnected) {
                    return const ConnectionErrorWidget();
                  }
                  return Padding(
                    padding: const EdgeInsets.all(AppConstants.bodyPadding),
                    child: Column(
                      children: [
                        const FilterWidget(),
                        SizedBox(height: 20.h),
                        state is GetPlantLoading && controller.plants.isEmpty
                            ? const Expanded(child: Loader())
                            :  const PlantsList(),
                      ],
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}
