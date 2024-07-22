import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_text_styles.dart';

ThemeData appTheme() {
  return ThemeData(
      primaryColor: AppColors.defaultColor,
      canvasColor: Colors.transparent,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: AppColors.backGroundColor,
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 2,
        centerTitle: true,
        titleTextStyle: AppTextStyles.title18BlackTextStyle,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
  );
}
