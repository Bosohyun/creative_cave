import 'package:creative_cave/core/common/widgets/CustomTextField.dart';
import 'package:creative_cave/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm(
      {required this.emailController,
      required this.fullNameController,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.formKey,
      super.key});

  final TextEditingController emailController;
  final TextEditingController fullNameController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> formKey;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: widget.fullNameController,
            labelText: "Full Name",
            keyboardType: TextInputType.name,
            prefixIcon: Icon(
              Icons.person,
              color: context.theme.colorScheme.secondary,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
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
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            controller: widget.confirmPasswordController,
            labelText: "Confirm Password",
            obscureText: obscureConfirmPassword,
            keyboardType: TextInputType.visiblePassword,
            prefixIcon:
                Icon(Icons.lock, color: context.theme.colorScheme.secondary),
            suffixIcon: IconButton(
              onPressed: () => setState(() {
                obscureConfirmPassword = !obscureConfirmPassword;
              }),
              icon: Icon(
                  obscureConfirmPassword
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.grey),
            ),
            validator: (value) {
              if (value != widget.passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          )
        ],
      ),
    );
  }
}
