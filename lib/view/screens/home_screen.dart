import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:plants_informations/control/home_control/home_cubit.dart';
import 'package:plants_informations/core/utils/app_strings.dart';
import 'package:plants_informations/view/widgets/connection_error.dart';
import 'package:plants_informations/view/widgets/custom_app_bar.dart';
import 'package:plants_informations/view/widgets/loader.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
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
                  return const Center(
                    child: Loader(),
                  );
                }),
          );
        },
      ),
    );
  }
}
