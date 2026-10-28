import 'dart:math' as math;

import 'package:flutter/material.dart';

const Color authBackground = Color(0xFFEDF6F9);
const Color authBlue = Color(0xFF204188);
const Color authCyan = Color(0xFF38B6FF);
const Color authFieldGray = Color(0xFFD9D9D9);

/// Gives each authentication page a centered, scrollable mobile layout.
class AuthPageLayout extends StatelessWidget {
  const AuthPageLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: authBackground,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final contentHeight = math
                .max(0.0, constraints.maxHeight - 108)
                .toDouble();

            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 92),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 340,
                        minHeight: contentHeight,
                      ),
                      child: child,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AuthHeading extends StatelessWidget {
  const AuthHeading({
    super.key,
    required this.text,
    this.align = TextAlign.center,
  });

  final String text;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: const TextStyle(
        fontFamily: 'Lemon',
        color: authBlue,
        fontSize: 23,
        height: 1.25,
      ),
    );
  }
}

class AuthSubtitle extends StatelessWidget {
  const AuthSubtitle({
    super.key,
    required this.text,
    this.align = TextAlign.center,
  });

  final String text;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: const TextStyle(color: Colors.black, fontSize: 12, height: 1.35),
    );
  }
}

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.hint,
    this.controller,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.obscureText = false,
    this.validator,
  });

  final String hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final bool obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    const radius = BorderRadius.all(Radius.circular(16));

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      obscureText: obscureText,
      validator: validator,
      style: const TextStyle(color: Colors.black87, fontSize: 13),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFF666666), fontSize: 12),
        filled: true,
        fillColor: authFieldGray,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 26,
        ),
        border: const OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide(color: authCyan, width: 1.2),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide(color: Color(0xFFB3261E), width: 1),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide(color: Color(0xFFB3261E), width: 1.2),
        ),
        errorStyle: const TextStyle(fontSize: 10, height: 1.2),
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: authBlue,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        child: Text(text),
      ),
    );
  }
}

class AuthLink extends StatelessWidget {
  const AuthLink({
    super.key,
    required this.text,
    required this.linkText,
    required this.onPressed,
    this.linkColor = authCyan,
  });

  final String text;
  final String linkText;
  final VoidCallback onPressed;
  final Color linkColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            text,
            textAlign: TextAlign.right,
            style: const TextStyle(color: Colors.black, fontSize: 11),
          ),
        ),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            foregroundColor: linkColor,
            padding: const EdgeInsets.symmetric(horizontal: 3),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            linkText,
            style: TextStyle(color: linkColor, fontSize: 11),
          ),
        ),
      ],
    );
  }
}

class TravelDoodle extends StatelessWidget {
  const TravelDoodle({
    super.key,
    required this.color,
    this.width = 220,
    this.height = 160,
  });

  final Color color;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(painter: _DottedRoutePainter(color)),
          ),
          Positioned(
            left: width * 0.07,
            top: height * 0.67,
            child: Icon(Icons.location_on_outlined, color: color, size: 25),
          ),
          Positioned(
            right: width * 0.03,
            top: height * 0.02,
            child: Transform.rotate(
              angle: math.pi / 4,
              child: Icon(Icons.airplanemode_active, color: color, size: 25),
            ),
          ),
        ],
      ),
    );
  }
}

class _DottedRoutePainter extends CustomPainter {
  const _DottedRoutePainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final route = Path()
      ..moveTo(size.width * 0.13, size.height * 0.77)
      ..cubicTo(
        size.width * 0.34,
        size.height * 0.98,
        size.width * 0.31,
        size.height * 0.48,
        size.width * 0.52,
        size.height * 0.42,
      )
      ..cubicTo(
        size.width * 0.72,
        size.height * 0.35,
        size.width * 0.82,
        size.height * 0.71,
        size.width * 0.67,
        size.height * 0.82,
      )
      ..cubicTo(
        size.width * 0.53,
        size.height * 0.92,
        size.width * 0.47,
        size.height * 0.72,
        size.width * 0.58,
        size.height * 0.57,
      )
      ..cubicTo(
        size.width * 0.68,
        size.height * 0.42,
        size.width * 0.80,
        size.height * 0.25,
        size.width * 0.91,
        size.height * 0.13,
      );

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..strokeCap = StrokeCap.round;

    for (final metric in route.computeMetrics()) {
      var distance = 0.0;
      const dashLength = 4.0;
      const gapLength = 5.0;

      while (distance < metric.length) {
        final end = math.min(distance + dashLength, metric.length).toDouble();
        canvas.drawPath(metric.extractPath(distance, end), paint);
        distance += dashLength + gapLength;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DottedRoutePainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

String? requiredField(String? value, String fieldName) {
  if (value == null || value.trim().isEmpty) {
    return 'Enter your $fieldName';
  }
  return null;
}

String? emailField(String? value) {
  final email = value?.trim() ?? '';
  if (email.isEmpty) {
    return 'Enter your email';
  }
  if (!email.contains('@') || !email.contains('.')) {
    return 'Enter a valid email';
  }
  return null;
}
