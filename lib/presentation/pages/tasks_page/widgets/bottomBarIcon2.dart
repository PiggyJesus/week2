import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week2/presentation/app_colors.dart';

class BottomBarIcon2 extends StatelessWidget {
  late final Color iconColor;
  final void Function() func;
  BottomBarIcon2(bool isSelected, this.func, {Key? key}) : super(key: key) {
    iconColor = isSelected ? AppColors.selectedSort : AppColors.sort;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.w,
      height: 40.h,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        onPressed: func,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 5.w, top: 3.33.h),
              child: SvgPicture.asset(
                'lib/presentation/assets/letterZ.svg',
                height: 15.h,
                color: iconColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w, top: 22.h),
              child: SvgPicture.asset(
                'lib/presentation/assets/letterA.svg',
                height: 15.h,
                color: iconColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(23.33.w, 30.h, 3.33.w, 3.33.h),
              child: SvgPicture.asset(
                'lib/presentation/assets/downTip.svg',
                height: 6.67.h,
                width: 13.33.w,
                color: iconColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(27.w, 3.33.h, 9.w, 3.75.h),
              child: SvgPicture.asset(
                'lib/presentation/assets/shaft.svg',
                height: 32.92.h,
                color: iconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
