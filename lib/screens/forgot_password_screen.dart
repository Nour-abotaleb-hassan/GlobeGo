import 'package:flutter/material.dart';

import '../widgets/auth_widgets.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  void _sendResetLink() {
    if (!_formKey.currentState!.validate()) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'If the account exists, reset instructions will be sent.',
        ),
      ),
    );
  }

  void _backToLogin() {
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
              const SizedBox(height: 74),
              const AuthHeading(
                text: 'Forgot your password',
                align: TextAlign.left,
              ),
              const SizedBox(height: 7),
              const SizedBox(
                width: 250,
                child: AuthSubtitle(
                  text: 'Enter your username and we’ll help you reset your password.',
                  align: TextAlign.left,
                ),
              ),
              const SizedBox(height: 52),
              Form(
                key: _formKey,
                child: AuthTextField(
                  hint: 'Email or username',
                  validator: (value) =>
                      requiredField(value, 'email or username'),
                ),
              ),
              const SizedBox(height: 33),
              AuthButton(text: 'Reset Password', onPressed: _sendResetLink),
              const SizedBox(height: 10),
              TextButton(
                onPressed: _backToLogin,
                style: TextButton.styleFrom(
                  foregroundColor: authCyan,
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text('SignIn', style: TextStyle(fontSize: 13)),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Material(
              color: authBlue,
              shape: const CircleBorder(),
              child: InkWell(
                onTap: _backToLogin,
                customBorder: const CircleBorder(),
                child: const SizedBox(
                  width: 34,
                  height: 34,
                  child: Icon(Icons.arrow_back, color: Colors.white, size: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
