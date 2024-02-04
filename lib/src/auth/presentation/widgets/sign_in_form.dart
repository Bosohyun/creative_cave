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
              style: TextStyle(
                color: context.theme.colorScheme.secondary,
              ),
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: context.theme.colorScheme.secondary,
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      20.0,
                    ),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      20.0,
                    ),
                  ),
                  borderSide: BorderSide(
                    color: context.theme.colorScheme.tertiary,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.email,
                  color: context.theme.colorScheme.secondary,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      20.0,
                    ),
                  ),
                  borderSide: BorderSide(
                    color: context.theme.colorScheme.secondary,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: context.width * 0.8,
            child: TextFormField(
              obscureText: obscurePassword,
              style: TextStyle(
                color: context.theme.colorScheme.secondary,
              ),
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      20.0,
                    ),
                  ),
                  borderSide: BorderSide(
                    color: context.theme.colorScheme.tertiary,
                  ),
                ),
                labelText: 'Password',
                labelStyle: const TextStyle(
                  color: Color.fromARGB(255, 197, 188, 188),
                ),
                hintText: '',
                prefixIcon: const Icon(
                  Icons.key,
                  color: Color.fromARGB(255, 197, 188, 188),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      20.0,
                    ),
                  ),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 197, 188, 188),
                  ),
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
            ),
          ),
        ],
      ),
    );
  }
}
