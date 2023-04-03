import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week2/app_colors.dart';

class BottomBarIcon3 extends StatelessWidget {
  late final Color iconColor;
  final void Function() func;
  BottomBarIcon3(bool isSelected, this.func, {Key? key}) : super(key: key) {
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
              padding: EdgeInsets.only(left: 3.5.w, top: 5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'lib/pages/assets/line1.svg',
                    height: 2.86.h,
                    color: iconColor,
                  ),
                  const SizedBox(height: 8.57),
                  SvgPicture.asset(
                    'lib/pages/assets/line2.svg',
                    height: 2.86.h,
                    color: iconColor,
                  ),
                  const SizedBox(height: 8.57),
                  SvgPicture.asset(
                    'lib/pages/assets/line3.svg',
                    height: 2.86.h,
                    color: iconColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 21.65.w, top: 14.29.h),
              child: SvgPicture.asset(
                'lib/pages/assets/smallArrow.svg',
                height: 20.71.h,
                color: iconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
