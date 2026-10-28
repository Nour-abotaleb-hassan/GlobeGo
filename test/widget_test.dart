import 'package:flutter_test/flutter_test.dart';
import 'package:task_session_flutter/main.dart';

void main() {
  testWidgets('shows the GlobeGo login screen', (tester) async {
    await tester.pumpWidget(const GlobeGoApp());

    expect(find.text('Welcome Back'), findsOneWidget);
    expect(find.text('Signin to access your account'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Forgot password'), findsOneWidget);
  });
}
