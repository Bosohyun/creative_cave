import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:creative_cave/core/common/app/theme/app_theme.dart';
import 'package:creative_cave/core/extensions/context_extension.dart';
import 'package:creative_cave/core/utils/core_utils.dart';
import 'package:creative_cave/src/auth/presentation/bloc/auth_bloc.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailVerificationView extends StatefulWidget {
  const EmailVerificationView({super.key});

  @override
  State<EmailVerificationView> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationView> {
  bool isEmailVerified = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer =
        Timer.periodic(const Duration(seconds: 3), (_) => checkEmailVerified());
  }

  checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();
    if (mounted) {
      setState(() {
        isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
      });
    }

    if (isEmailVerified) {
      if (isEmailVerified) {
        timer?.cancel();

        // snackbar to show email verified

        if (mounted) {
          CoreUtils.showSnackBar(context, 'Email Verified');
        }

        //naviage to sign in screen
        if (mounted) {
          final navigator = Navigator.of(context);

          await FirebaseAuth.instance.signOut();

          unawaited(navigator.pushNamedAndRemoveUntil(
            '/',
            (route) => false,
          ));
        }
      }
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //listen firebase auth email verification

    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: context.theme.colorScheme.background,
        body: Container(
          decoration:
              const BoxDecoration(gradient: AppTheme.signInBackgroundGradient),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Verify your email to continue',
                  style: context.theme.textTheme.displayLarge
                      ?.copyWith(color: context.theme.colorScheme.primary),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: context.theme.colorScheme.secondary,
                      foregroundColor: context.theme.colorScheme.tertiary,
                      minimumSize: Size(
                        context.width * 0.5,
                        45,
                      ),
                      elevation: 10),
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    FirebaseAuth.instance.currentUser?.reload();
                    if (FirebaseAuth.instance.currentUser!.emailVerified) {
                      final navigator = Navigator.of(context);

                      unawaited(navigator.pushNamedAndRemoveUntil(
                        '/',
                        (route) => false,
                      ));
                    }
                  },
                  child: AutoSizeText(
                    'Back to Sign In',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: context.theme.colorScheme.primary),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
