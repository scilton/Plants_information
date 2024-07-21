import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_informations/core/utils/app_text_styles.dart';

class ConnectionErrorWidget extends StatelessWidget {
  const ConnectionErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 1.sw ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset('assets/image/connection_error.png',width: 150.w,),
            SizedBox(height: 20.h),
            Text(
              'No internet connection',
              style: AppTextStyles.title18BlackTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
