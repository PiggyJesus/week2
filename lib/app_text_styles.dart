import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week2/app_colors.dart';

class AppTextStyles {
  static final title = TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 34.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.title,
      letterSpacing: 0.37.w,
  );

  static final hidingButton = TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.hidingButton,
  );

  static final taskName = TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.taskName,
    letterSpacing: -0.24.w,
    height: 4 / 3,
  );

  static final taskNameCompleted = taskName.copyWith(
      decoration: TextDecoration.lineThrough,
    color: AppColors.taskNameCompleted,
  );

  static final taskDateTime = TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.taskDateTime,
    letterSpacing: -0.08.w,
    height: 18 / 13,
    fontStyle: FontStyle.italic,
  );

  static final taskDateTimeCompleted = taskDateTime.copyWith(
    decoration: TextDecoration.lineThrough,
    color: AppColors.taskDateTimeCompleted,
  );

  static final appBarTitle = TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 17.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.title,
    letterSpacing: -0.41.w,
  );

  static final backButton = TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 17.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.backButton,
    letterSpacing: -0.41.w,
  );

  static final addCategory = TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.title,
    letterSpacing: 0.38.w,
  );

  static final dateTimePicker = TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.title,
    letterSpacing: 0.35.w,
  );

  static final done = TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.doneText,
    letterSpacing: -0.34.w,
  );
}
