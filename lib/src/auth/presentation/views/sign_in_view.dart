import 'package:auto_size_text/auto_size_text.dart';
import 'package:creative_cave/core/common/app/providers/user_provider.dart';
import 'package:creative_cave/core/common/app/theme/app_theme.dart';
import 'package:creative_cave/core/extensions/context_extension.dart';
import 'package:creative_cave/core/res/media_res.dart';
import 'package:creative_cave/core/utils/core_utils.dart';
import 'package:creative_cave/src/auth/data/models/user_model.dart';
import 'package:creative_cave/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:creative_cave/src/auth/presentation/views/sign_up_view.dart';
import 'package:creative_cave/src/auth/presentation/widgets/sign_in_form.dart';
import 'package:creative_cave/src/dashboard/presentation/views/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  static const routeName = '/sign-in';

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF324037).withAlpha(100),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state is AuthError) {
            CoreUtils.showSnackBar(context, state.message);
          } else if (state is SignedIn) {
            await Future.delayed(const Duration(milliseconds: 500));
            if (mounted) {
              context
                  .read<UserProvider>()
                  .initUser(state.user as LocalUserModel);
              Navigator.pushReplacementNamed(context, Dashboard.routeName);
            }
          }
        },
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(
                gradient: AppTheme.signInBackgroundGradient),
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
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, SignUpView.routeName);
                      },
                      child: Text(
                        'Register account?',
                        style: TextStyle(
                          color: context.theme.colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                ),
                SignInForm(
                  emailController: emailController,
                  passwordController: passwordController,
                  formKey: formKey,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: context.width * 0.08,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/forgot-password');
                      },
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
                  child: (state is AuthLoading)
                      ? const CircularProgressIndicator()
                      : (state is SignedIn)
                          ? const Icon(
                              Icons.done,
                              color: Color.fromARGB(
                                255,
                                38,
                                88,
                                40,
                              ),
                              size: 40,
                            )
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      context.theme.colorScheme.secondary,
                                  foregroundColor:
                                      context.theme.colorScheme.tertiary,
                                  minimumSize: Size(
                                    context.width * 0.5,
                                    45,
                                  ),
                                  elevation: 10),
                              onPressed: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                FirebaseAuth.instance.currentUser?.reload();
                                if (formKey.currentState!.validate()) {
                                  context.read<AuthBloc>().add(
                                        SignInEvent(
                                          email: emailController.text.trim(),
                                          password:
                                              passwordController.text.trim(),
                                        ),
                                      );
                                }
                              },
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
                  onTap: () {
                    context.read<AuthBloc>().add(
                          SignInWithGoogleEvent(),
                        );
                  },
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
          );
        },
      ),
    );
  }
}
