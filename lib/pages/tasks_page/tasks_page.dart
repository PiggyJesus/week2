import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week2/app_text_styles.dart';
import 'package:week2/pages/tasks_page/widgets/task.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  var _completedIsHided = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            Text(
              'My tasks',
              style: AppTextStyles.title,
            ),
          ],
        ),
        actions: [
          SizedBox(
            width: 130.w,
            height: 100.h,
            child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: AppTextStyles.hidingButton,
                  //fixedSize: Size(110.w, 21.h)
                ),
                onPressed: () {
                  setState(() {
                    _completedIsHided = !_completedIsHided;
                  });
                },
                child: Text(
                    _completedIsHided ? 'Show complited' : 'Hide completed')),
          ),
        ],
      ),
      body: Column(
        children: [
          Task(
            false,
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
            DateTime.now(),
          ),
          Task(
            true,
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
            DateTime.now(),
          ),
        ],
      ),
      floatingActionButton: Row(
        children: [
          SizedBox(width: 30.w),
          SizedBox(
            width: 42.w,
            height: 42.h,
            child: TextButton(
              style: TextButton.styleFrom(
                  padding: EdgeInsets.zero
              ),
              onPressed: () {},
              child: Stack(
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'lib/pages/assets/circle.svg',
                      width: 42.w,
                    ),
                  ),
                  Center(
                    child: SvgPicture.asset(
                      'lib/pages/assets/circled_i.svg',
                      width: 32.w,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 42.w,
            height: 42.h,
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero
              ),
              onPressed: () {},
              child: Stack(
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'lib/pages/assets/circle.svg',
                      width: 42.w,
                    ),
                  ),
                  Center(
                    child: SvgPicture.asset(
                      'lib/pages/assets/plus.svg',
                      width: 17.68.w,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Row(
        children: [
          
        ],
      ),
    );
  }
}
