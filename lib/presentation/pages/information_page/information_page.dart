import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week2/presentation/app_text_styles.dart';

import '../../app_colors.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key}) : super(key: key);

  final anekdot = 'Идёт бобёр к своей хатке в реке через лес. Вдруг слышит \n' +
  '- Ку-ку \n'+
  'Оборачивается, озирается - нет никого. Идёт дальше, вдруг снова \n' +
  '- Ку-ку \n'+
  'Снова оглядывается - никого нет. Идёт дальше, доходит до самой реки, и вдруг снова слышит \n'+
  '- Ку-ку \n'+
  'И тут выскакивает из кустов заикающийся поляк: \n'+
  '- Ку-ку-КУРВА Bóbr kurwa! Ja pierdole, jakie bydlę! BOBER! Ej, kurwa, bober! Bober, nie spierdalaj, mordo! Chodź tu, kurwo, do mnie! Bober! Ale jesteś kurwa duży, ty! JA PIERDOLE, PIERWSZY RAZ W ŻYCIU WIDZĘ BOBRA! JAKIE BYDLĘ JEBANE, spierolił do wody śze wpopiv!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.w, 50.h, 30.w, 41.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Information',
              style: AppTextStyles.title,
            ),
            SizedBox(height: 41.h),
            Text(
              anekdot,
              style: AppTextStyles.small,
            ),
            const Spacer(),
            ClipRRect(
              borderRadius: BorderRadius.circular(11.58.r),
              child: Container(
                color: AppColors.doneButton,
                width: 315.w,
                height: 46.h,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Got it!',
                    style: AppTextStyles.done,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
