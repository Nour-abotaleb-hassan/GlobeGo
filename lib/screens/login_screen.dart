import 'package:flutter/material.dart';

import '../widgets/auth_widgets.dart';
import 'forgot_password_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  void _login() {
    if (!_formKey.currentState!.validate()) return;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Your login form is ready.')));
  }

  void _openForgotPassword() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => const ForgotPasswordScreen(),
      ),
    );
  }

  void _openSignUp() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute<void>(builder: (context) => const SignupScreen()));
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
              const SizedBox(height: 54),
              const Center(child: TravelDoodle(color: authCyan, height: 190)),
              const SizedBox(height: 7),
              const AuthHeading(text: 'Welcome Back'),
              const SizedBox(height: 2),
              const AuthSubtitle(text: 'Signin to access your account'),
              const SizedBox(height: 44),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AuthTextField(
                      hint: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      validator: emailField,
                    ),
                    const SizedBox(height: 17),
                    AuthTextField(
                      hint: 'Password',
                      obscureText: true,
                      validator: (value) => requiredField(value, 'password'),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: _openForgotPassword,
                        style: TextButton.styleFrom(
                          foregroundColor: authCyan,
                          padding: const EdgeInsets.only(top: 5, left: 8),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          'Forgot password',
                          style: TextStyle(fontSize: 11),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              AuthButton(text: 'Login', onPressed: _login),
              const SizedBox(height: 9),
              AuthLink(
                text: 'Don’t have an account?',
                linkText: 'SignUp',
                onPressed: _openSignUp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
