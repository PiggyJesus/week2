import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week2/presentation/app_text_styles.dart';
import 'package:week2/domain/entities/todo_entity.dart';


class Task extends StatelessWidget {
  final void Function() onPressed;

  final TodoEntity todo;

  bool get isCompleted => todo.isCompleted;

  String get name => todo.name;

  DateTime get dateTime => todo.finishTime;

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
        SizedBox(width: 25.w),
        SizedBox(
          width: 20.w,
          height: 20.h,
          child: TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            onPressed: onPressed,
            child: isCompleted
                ? const FullCheckIcon()
                : SvgPicture.asset(
                    'lib/presentation/assets/empty_check.svg',
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
                    : AppTextStyles.small,
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
        ),
        SizedBox(width: 25.w),
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
            'lib/presentation/assets/full_check.svg',
            width: 20.w,
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 3.w),
            child: SvgPicture.asset(
              'lib/presentation/assets/ok.svg',
              width: 14.w,
              height: 10.h,
            ),
          )
        ],
      ),
    );
  }
}
