import 'package:creative_cave/core/common/widgets/CustomTextField.dart';
import 'package:creative_cave/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    super.key,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: widget.emailController,
            labelText: "Email Address",
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icon(
              Icons.email,
              color: context.theme.colorScheme.secondary,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
              controller: widget.passwordController,
              labelText: "Password",
              obscureText: obscurePassword,
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: Icon(
                Icons.lock,
                color: context.theme.colorScheme.secondary,
              ),
              suffixIcon: IconButton(
                onPressed: () => setState(() {
                  obscurePassword = !obscurePassword;
                }),
                icon: Icon(
                  obscurePassword ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
              ))
        ],
      ),
    );
  }
}
