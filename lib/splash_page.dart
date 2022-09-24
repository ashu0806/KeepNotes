import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_app/core/routes/routes.gr.dart';

// final initialProvider = FutureProvider<Unit>(
//   (ref) {
//     final userData = ref.read(logInNotifierProvider.notifier);
//     userData.isLogin();
//     return unit;
//   },
// );

class SplashPage extends HookConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        AutoRouter.of(context).push(
          const LogInRoute(),
        );
      },
    );
    // ref.listen(initialProvider, (previous, next) {});
    // ref.listen<LogInState>(
    //   logInNotifierProvider,
    //   ((previousState, nextState) {
    //     Future.delayed(
    //       const Duration(
    //         seconds: 2,
    //       ),
    //       () {
    //         nextState.maybeMap(
    //           orElse: () {},
    //           authenticated: (value) {
    //             AutoRouter.of(context).pushAndPopUntil(
    //               const DashboardRoute(),
    //               predicate: (route) => false,
    //             );
    //           },
    //           unauthenticated: (value) {
    //             AutoRouter.of(context).pushAndPopUntil(
    //               const LogInRoute(),
    //               predicate: (route) => false,
    //             );
    //           },
    //         );
    //       },
    //     );
    //   }),
    // );
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/logInPageImages/logo.png',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              "Notes App",
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 18.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
