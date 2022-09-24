import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:notes_app/auth/widgets/user_details_field.dart';
import 'package:notes_app/core/routes/routes.gr.dart';
import 'package:notes_app/core/utils/app_constant.dart';

class LogInPage extends HookConsumerWidget {
  const LogInPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var emailController = useTextEditingController();
    var passwordController = useTextEditingController();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 228, 228),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (noti) {
          noti.disallowIndicator();
          return true;
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25.w,
                ),
                child: SizedBox(
                  height: 200.h,
                  child: Lottie.asset(
                    'assets/logInPageImages/logInPageAnimation.json',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 5.w,
                ),
                child: Text(
                  "Log In",
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              UserDetailsField(
                hintText: "Enter your email",
                controller: emailController,
                validator: (value1) {
                  return null;
                },
                action: TextInputAction.next,
              ),
              UserDetailsField(
                hintText: "Password",
                controller: passwordController,
                validator: (value2) {
                  return null;
                },
                action: TextInputAction.done,
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 40.w,
                ),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40.h,
                    width: 150.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        8.r,
                      ),
                      color: Colors.purple,
                    ),
                    child: Text(
                      "Submit",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 20.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 120.h,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    AutoRouter.of(context).push(
                      const SignUpRoute(),
                    );
                  },
                  child: Text.rich(
                    TextSpan(
                      text: "Didn't have a account? ",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontSize: 15.sp,
                            color: AppConstant.appBlack,
                            fontWeight: FontWeight.w400,
                          ),
                      children: [
                        TextSpan(
                          text: "SignUp",
                          style:
                              Theme.of(context).textTheme.headline3!.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
