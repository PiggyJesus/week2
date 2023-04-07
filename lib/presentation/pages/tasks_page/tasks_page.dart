import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week2/presentation/app_text_styles.dart';
import 'package:week2/domain/repository/todos_bloc.dart';
import '../add_page/add_page.dart';
import '../tasks_page/widgets/bottomBarIcon1.dart';
import '../tasks_page/widgets/bottomBarIcon2.dart';
import '../tasks_page/widgets/bottomBarIcon3.dart';
import '../tasks_page/widgets/task.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week2/presentation/sort_types.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  var _completedIsHided = false;
  var sortType = SortTypes.AtoZ;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (context, state) {
        var todoBloc = BlocProvider.of<TodosBloc>(context);

        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 85.h,
            elevation: 0,
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
          backgroundColor: Colors.white,
          body: Builder(
            builder: (BuildContext context) {
              if (state is TodosLoadedState) {
                if (todoBloc.notCompleted.length == 0 &&
                    (_completedIsHided || todoBloc.completed.length == 0)) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 27.w),
                        width: 165.w,
                        child: Text(
                          'Looks like there is no tasks yet! Go ahead and push a plus button below',
                          style: AppTextStyles.small,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 60.w, top: 40.h),
                        child: SvgPicture.asset(
                          'lib/presentation/assets/twoDaysArrow.svg',
                          height: 420.h,
                        ),
                      ),
                    ],
                  );
                } else {
                  return SizedBox(
                    height: 550.h,
                    child: ListView(
                      children: List.generate(
                            todoBloc.notCompleted.length,
                            (index) => Task(
                              todoBloc.notCompleted[index],
                              () {
                                todoBloc.add(TodosUpdateEvent(
                                  true,
                                  todoBloc.notCompleted[index].id!,
                                ));
                              },
                            ),
                          ) +
                          (_completedIsHided
                              ? []
                              : List.generate(
                                  todoBloc.completed.length,
                                  (index) => Task(
                                    todoBloc.completed[index],
                                    () {
                                      todoBloc.add(TodosUpdateEvent(
                                        false,
                                        todoBloc.completed[index].id!,
                                      ));
                                    },
                                  ),
                                )),
                    ),
                  );
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          floatingActionButton: Row(
            children: [
              SizedBox(width: 30.w),
              SizedBox(
                width: 42.w,
                height: 42.h,
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () {
                    Navigator.pushNamed(context, '/information_page');
                  },
                  child: Stack(
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          'lib/presentation/assets/circle.svg',
                          width: 42.w,
                        ),
                      ),
                      Center(
                        child: SvgPicture.asset(
                          'lib/presentation/assets/circled_i.svg',
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
                        return AddPage();
                      },
                    );
                  },
                  child: Stack(
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          'lib/presentation/assets/circle.svg',
                          width: 42.w,
                        ),
                      ),
                      Center(
                        child: SvgPicture.asset(
                          'lib/presentation/assets/plus.svg',
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
                BottomBarIcon1(
                  sortType == SortTypes.AtoZ,
                  () {
                    if (sortType != SortTypes.AtoZ) {
                      setState(() {
                        sortType = SortTypes.AtoZ;
                      });
                      todoBloc.add(TodosSortEvent(
                        sortType: SortTypes.AtoZ,
                      ));
                    }
                  },
                ),
                SizedBox(width: 82.w),
                BottomBarIcon2(
                  sortType == SortTypes.ZtoA,
                  () {
                    if (sortType != SortTypes.ZtoA) {
                      setState(() {
                        sortType = SortTypes.ZtoA;
                      });
                      todoBloc.add(TodosSortEvent(
                        sortType: SortTypes.ZtoA,
                      ));
                    }
                  },
                ),
                SizedBox(width: 82.w),
                BottomBarIcon3(
                  sortType == SortTypes.time,
                  () {
                    if (sortType != SortTypes.time) {
                      setState(() {
                        sortType = SortTypes.time;
                      });
                      todoBloc.add(TodosSortEvent(
                        sortType: SortTypes.time,
                      ));
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
