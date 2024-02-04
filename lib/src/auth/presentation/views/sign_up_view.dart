import 'package:auto_size_text/auto_size_text.dart';
import 'package:creative_cave/core/common/app/theme/app_theme.dart';
import 'package:creative_cave/core/extensions/context_extension.dart';
import 'package:creative_cave/core/res/media_res.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  static const routeName = '/sign-up';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF324037).withAlpha(100),
      body: Container(
        decoration:
            const BoxDecoration(gradient: AppTheme.lightBackgroundGradient),
        child: ListView(
          children: [
            SizedBox(height: context.height * 0.03),
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
            SizedBox(
              height: context.height * 0.03,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: context.width * 0.08,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Register account?',
                    style: TextStyle(
                      color: context.theme.colorScheme.secondary,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: context.width * 0.08,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: context.theme.colorScheme.secondary,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: context.height * 0.03,
            ),
            Align(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: context.theme.colorScheme.secondary,
                    foregroundColor: context.theme.colorScheme.tertiary,
                    minimumSize: Size(
                      context.width * 0.5,
                      45,
                    ),
                    elevation: 10),
                onPressed: () {},
                child: const AutoSizeText(
                  'Sign In',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: context.height * 0.05,
            ),
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                width: 40,
                height: 40,
                child: Image.asset(
                  'assets/icons/google.png',
                ),
              ),
            ),
            SizedBox(
              height: context.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
