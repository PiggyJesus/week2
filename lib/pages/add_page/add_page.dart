import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week2/app_text_styles.dart';
import 'package:week2/bloc/todo_class.dart';
import 'package:week2/bloc/todos_bloc.dart';
import 'package:week2/pages/add_page/widgets/backButton.dart';

import '../../app_colors.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  final _textController = TextEditingController();
  DateTime _dateTime = DateTime.now();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _selectTime() async {
    final newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_dateTime),
    );

    if (newTime != null) {
      setState(() {
        _dateTime = _dateTime.copyWith(
          hour: newTime.hour,
          minute: newTime.minute,
        );
      });
    }
  }

  void _selectDate() async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (newDate != null) {
      setState(() {
        _dateTime = _dateTime.copyWith(
          year: newDate.year,
          month: newDate.month,
          day: newDate.day,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //var bl = BlocProvider.of<TodosBloc>(context);
    return Container(
      height: 752.h,
      child: Column(
        children: [
          SizedBox(
            height: 45.h,
            child: Stack(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: MyBackButton(),
                ),
                Center(
                  child: Text(
                    'Task',
                    style: AppTextStyles.appBarTitle,
                  ),
                )
              ],
            ),
          ),
          Divider(height: 1.h),
          Padding(
            padding: EdgeInsets.only(left: 29.w, top: 35.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add a task',
                  style: AppTextStyles.title,
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  height: 64.h,
                  child: Row(
                    children: [
                      Text(
                        'Name',
                        style: AppTextStyles.addCategory,
                      ),
                      SizedBox(width: 11.w),
                      SizedBox(
                        width: 241.w,
                        height: 27.h,
                        child: TextField(
                          controller: _textController,
                          decoration: const InputDecoration(
                            focusColor: AppColors.taskName,
                            //border: InputBorder(borderSide: BorderSide()),
                            hintText: 'Input Name',
                          ),
                          style: AppTextStyles.taskName,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 64.h,
                  child: Row(
                    children: [
                      Text(
                        'Time',
                        style: AppTextStyles.addCategory,
                      ),
                      SizedBox(width: 17.w),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.r),
                        child: Container(
                          width: 86.w,
                          height: 36.h,
                          //color: AppColors.dateTimePickers,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.dateTimePickers,
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: _selectTime,
                            child: Text(
                              _dateTime.hour.toString().padLeft(2, '0') +
                                  ':' +
                                  _dateTime.minute.toString().padLeft(2, '0'),
                              style: AppTextStyles.dateTimePicker,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 64.h,
                  child: Row(
                    children: [
                      Text(
                        'Date',
                        style: AppTextStyles.addCategory,
                      ),
                      SizedBox(width: 22.w),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.r),
                        child: Container(
                          width: 163.w,
                          height: 36.h,
                          //color: AppColors.dateTimePickers,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.dateTimePickers,
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: _selectDate,
                            child: Text(
                              _dateTime.day.toString().padLeft(2, '0') +
                                  '.' +
                                  _dateTime.month.toString().padLeft(2, '0') +
                                  '.' +
                                  _dateTime.year.toString().padLeft(4, '0'),
                              style: AppTextStyles.dateTimePicker,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 33.h),
                ClipRRect(
                  borderRadius: BorderRadius.circular(11.58.r),
                  child: Container(
                    color: AppColors.doneButton,
                    width: 316.w,
                    height: 46.h,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        BlocProvider.of<TodosBloc>(context)
                            .add(TodosInsertEvent(TodoClass(
                          name: _textController.value.text,
                          createTime: _dateTime,
                        )));
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Done',
                        style: AppTextStyles.done,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
