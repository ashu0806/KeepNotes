import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

mixin AppConstant {
  static const Color primaryColor = Color.fromARGB(255, 7, 33, 162);
  static const Color secondaryColor = Color.fromARGB(255, 63, 91, 229);
  static const Color primaryColordark = Color.fromARGB(255, 5, 18, 79);
  static const Color subtitle1color = Color.fromARGB(255, 81, 81, 81);
  static const Color appBlack = Color.fromARGB(255, 0, 0, 0);
  static const Color appwhite = Color(0xffFFFFFF);

  static const userId = "userId";
  static showLoader(context, String message, {Color? color}) {
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            height: 60.h,
            width: 260.w,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(
                12.r,
              ),
            ),
            child: Row(
              children: [
                Lottie.asset(
                  'assets/logInPageImages/loading.json',
                  fit: BoxFit.contain,
                ),
                Expanded(
                  child: Text(
                    message,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontSize: 15.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static showSnackbar(context, String message, Color color) {
    final snackBar = SnackBar(
      content: Text(
        message,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          15.r,
        ),
      ),
      backgroundColor: color,
      duration: const Duration(
        seconds: 1,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
