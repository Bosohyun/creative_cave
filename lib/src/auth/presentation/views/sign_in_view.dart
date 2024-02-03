import 'package:creative_cave/core/app/theme/app_theme.dart';
import 'package:creative_cave/core/extensions/context_extension.dart';
import 'package:creative_cave/core/res/media_res.dart';
import 'package:creative_cave/src/auth/presentation/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  static const routeName = '/';

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF324037).withAlpha(100),
      body: Container(
        decoration: BoxDecoration(gradient: AppTheme.lightBackgroundGradient),
        child: ListView(
          children: [
            SizedBox(height: context.height * 0.1),
            Container(
              height: context.height * 0.3,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                MediaRes.signInScreenImage,
              ),
            ),
            SignInForm(),
            SizedBox(
              height: context.height * 0.2,
            ),
            ElevatedButton(onPressed: () {}, child: Text('Sign In')),
          ],
        ),
      ),
    );
  }
}
