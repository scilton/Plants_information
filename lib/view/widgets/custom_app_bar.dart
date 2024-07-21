import 'package:flutter/material.dart';
import 'package:plants_informations/core/utils/app_text_styles.dart';

customAppBar(BuildContext context,
    {required String title, bool backButton = false}) {
  return AppBar(
    title: Text(
      title,
      style: AppTextStyles.title18BlackTextStyle,
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: backButton
        ? IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: const Color(0xFF707070),
          )
        : const SizedBox(),
  );
}
