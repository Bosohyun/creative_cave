import 'package:creative_cave/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Container(
          width: context.width * 0.8,
          child: TextFormField(
              decoration: const InputDecoration(
            labelText: 'Email',
            hintText: '',
            prefixIcon: Icon(
              Icons.email,
              color: Color.fromARGB(255, 197, 188, 188),
            ),
          )),
        ),
        Container(
          width: context.width * 0.8,
          child: TextFormField(
              decoration: const InputDecoration(
            labelText: 'Password',
            hintText: '',
            prefixIcon: Icon(
              Icons.key,
              color: Color.fromARGB(255, 197, 188, 188),
            ),
          )),
        ),
      ],
    ));
  }
}
