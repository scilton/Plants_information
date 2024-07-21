import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_informations/control/home_control/home_cubit.dart';

import '../../core/utils/app_text_styles.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit controller = context.read<HomeCubit>();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SizedBox(
          height: 60.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: InkWell(
                onTap: () {
                  controller.changeFilter(index);
                },
                child: Card(
                  elevation: 2,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: controller.filterSelectedIndex == index
                          ? Colors.blue
                          : Colors.grey,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      controller.filterList[index]['name']!,
                      style: AppTextStyles.text14BlackTextStyle,
                    ),
                  ),
                ),
              ),
            ),
            itemCount: controller.filterList.length,
          ),
        );
      },
    );
  }
}
