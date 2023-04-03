import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week2/app_text_styles.dart';
import 'package:week2/bloc/todos_bloc.dart';
import 'package:week2/pages/add_page/add_page.dart';
import 'package:week2/pages/tasks_page/widgets/bottomBarIcon1.dart';
import 'package:week2/pages/tasks_page/widgets/bottomBarIcon2.dart';
import 'package:week2/pages/tasks_page/widgets/bottomBarIcon3.dart';
import 'package:week2/pages/tasks_page/widgets/task.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TasksPageWrapper extends StatelessWidget {
  const TasksPageWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodosBloc()..add(TodosGetEvent()),
      child: const TasksPage(),
    );
  }
}

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  var _completedIsHided = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (context, state) {
        var todoBloc = BlocProvider.of<TodosBloc>(context);

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
                    child: Text(_completedIsHided
                        ? 'Show complited'
                        : 'Hide completed')),
              ),
            ],
          ),
          body: state is TodosLoadedState
              ? Column(
                  children: [
                    // Task(
                    //   todoBloc.completed[0],
                    // ),
                    // Task(
                    //   todoBloc.completed[1],
                    // ),
                  ],
                )
              : const Center(child: CircularProgressIndicator()),
          floatingActionButton: Row(
            children: [
              SizedBox(width: 30.w),
              SizedBox(
                width: 42.w,
                height: 42.h,
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
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
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10.sp),
                      )),
                      context: context,
                      builder: (context) {
                        return AppPage();
                      },
                    );
                  },
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
          bottomNavigationBar: SizedBox(
            height: 65.h,
            child: Row(
              children: [
                SizedBox(width: 45.w),
                BottomBarIcon1(true, () {}),
                SizedBox(width: 82.w),
                BottomBarIcon2(false, () {}),
                SizedBox(width: 82.w),
                BottomBarIcon3(false, () {}),
              ],
            ),
          ),
        );
      },
    );
  }
}
