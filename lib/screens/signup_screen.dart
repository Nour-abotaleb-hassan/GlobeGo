import 'package:flutter/material.dart';

import '../widgets/auth_widgets.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _createAccount() {
    if (!_formKey.currentState!.validate()) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Your sign up form is ready.')),
    );
  }

  void _goToLogin() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AuthPageLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 62),
              const Center(child: TravelDoodle(color: authBlue, height: 180)),
              const SizedBox(height: 4),
              const AuthHeading(text: 'Get Started'),
              const SizedBox(height: 2),
              const AuthSubtitle(text: 'Start opening your new account'),
              const SizedBox(height: 45),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AuthTextField(
                      hint: 'Full Name',
                      textCapitalization: TextCapitalization.words,
                      validator: (value) => requiredField(value, 'full name'),
                    ),
                    const SizedBox(height: 15),
                    AuthTextField(
                      hint: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      validator: emailField,
                    ),
                    const SizedBox(height: 15),
                    AuthTextField(
                      hint: 'password',
                      controller: _passwordController,
                      obscureText: true,
                      validator: (value) {
                        final error = requiredField(value, 'password');
                        if (error != null) return error;
                        if (value!.length < 6) {
                          return 'Use at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    AuthTextField(
                      hint: 'Check password',
                      obscureText: true,
                      validator: (value) {
                        final error = requiredField(value, 'password again');
                        if (error != null) return error;
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              AuthButton(text: 'SignUp', onPressed: _createAccount),
              const SizedBox(height: 9),
              AuthLink(
                text: 'Already have an account',
                linkText: 'Login',
                linkColor: authBlue,
                onPressed: _goToLogin,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
