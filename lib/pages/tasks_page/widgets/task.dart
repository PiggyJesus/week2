import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week2/app_text_styles.dart';

class Task extends StatelessWidget {
  final bool isCompleted;
  final String name;
  final DateTime dateTime;

  String get parsedDateTime =>
      '${dateTime.day}.${dateTime.month}.${dateTime.year}  ${dateTime.hour}:${dateTime.minute}';

  const Task(this.isCompleted, this.name, this.dateTime, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 13.w),
        isCompleted
            ? const FullCheckIcon()
            : SvgPicture.asset(
                'lib/pages/assets/empty_check.svg',
                width: 20.w,
                height: 20.h,
              ),
        SizedBox(width: 13.w),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.5.h),
              Text(
                name,
                style: isCompleted
                    ? AppTextStyles.taskNameCompleted
                    : AppTextStyles.taskName,
              ),
              SizedBox(height: 13.h),
              Text(
                parsedDateTime,
                style: isCompleted
                    ? AppTextStyles.taskDateTimeCompleted
                    : AppTextStyles.taskDateTime,
              ),
              SizedBox(height: 10.5.h),
            ],
          ),
        )
      ],
    );
  }
}



class FullCheckIcon extends StatelessWidget {
  const FullCheckIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          SvgPicture.asset(
            'lib/pages/assets/full_check.svg',
            width: 20.w,
            height: 20.h,

          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 3.w),
            child: SvgPicture.asset(
              'lib/pages/assets/ok.svg',
              width: 14.w,
              height: 10.h,

            ),
          )
        ],
      ),
    );
  }
}
