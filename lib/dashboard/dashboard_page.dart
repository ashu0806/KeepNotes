import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_app/auth/domain/signOutState/sign_out_state.dart';
import 'package:notes_app/auth/shared/providers.dart';
import 'package:notes_app/core/routes/routes.gr.dart';
import 'package:notes_app/core/utils/app_constant.dart';

class DashboardPage extends HookConsumerWidget {
  const DashboardPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SignOutState>(
      signOutNotifierProvider,
      (previous, state) {
        state.maybeMap(
          orElse: () {},
          success: (value) {
            AppConstant.showLoader(context, "Sign Out Successfully");
            Future.delayed(
              const Duration(seconds: 1),
              () async {
                AutoRouter.of(context).pushAndPopUntil(
                  const SignInRoute(),
                  predicate: (route) => false,
                );
              },
            );
          },
        );
      },
    );
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await ref.watch(signOutNotifierProvider.notifier).logOut();
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          "Dashboard Page",
        ),
      ),
    );
  }
}
