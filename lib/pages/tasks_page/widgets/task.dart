import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week2/app_text_styles.dart';
import 'package:week2/bloc/todo_class.dart';


class Task extends StatelessWidget {
  final void Function() onPressed;

  final TodoClass todo;

  bool get isCompleted => todo.isCompleted;

  String get name => todo.name;

  DateTime get dateTime => todo.createTime;

  String get parsedDateTime =>
      dateTime.day.toString().padLeft(2, '0') +
      '.' +
      dateTime.month.toString().padLeft(2, '0') +
      '.' +
      dateTime.year.toString().padLeft(4, '0') +
      '  ' +
      dateTime.hour.toString().padLeft(2, '0') +
      ':' +
      dateTime.minute.toString().padLeft(2, '0');

  const Task(this.todo, this.onPressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 13.w),
        SizedBox(
          width: 20.w,
          height: 20.h,
          child: TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            onPressed: onPressed,
            child: isCompleted
                ? const FullCheckIcon()
                : SvgPicture.asset(
                    'lib/pages/assets/empty_check.svg',
                    width: 20.w,
                    height: 20.h,
                  ),
          ),
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
