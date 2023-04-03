import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week2/app_text_styles.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 77.w,
      height: 42.h,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        onPressed: (){
          Navigator.pop(context);
        },
        child: Row(
          children: [
            SizedBox(width: 9.w),
            SvgPicture.asset(
              'lib/pages/assets/backButton.svg',
              height: 20.79.h,
              width: 12.w,
            ),
            SizedBox(width: 5.w),
            Text(
              'Close',
              style: AppTextStyles.backButton,
            ),
          ],
        ),
      ),
    );
  }
}
