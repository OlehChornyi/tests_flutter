import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tests_flutter/login_screen.dart';

void main() {
  group('Login Flow Test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets(
      'Should show Required Field error message when user taps on login button after providing empty email & password',
      (WidgetTester tester) async {
        //Arrange
        await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

        //Act
        Finder loginButton = find.byType(ElevatedButton);
        await tester.tap(loginButton);
        await tester.pumpAndSettle(Duration(seconds: 2));
        Finder errorMessage = find.text('Required Field');

        //Assert
        expect(errorMessage, findsNWidgets(2));
      },
    );

    testWidgets(
      'Should show home screen when user taps on login button after providing valid email & password',
      (WidgetTester tester) async {
        //Arrange
        await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

        //Act
        Finder userNameTextField = find.byKey(const ValueKey('email_id'));
        Finder passwordTextField = find.byKey(const ValueKey('password'));
        await tester.enterText(userNameTextField, 'i@i.com');
        await tester.enterText(passwordTextField, '12345678');

        Finder loginButton = find.byType(ElevatedButton);
        await tester.tap(loginButton);
        await tester.pumpAndSettle(Duration(seconds: 2));
        Finder welcomeText = find.byType(Text);

        //Assert
        expect(welcomeText, findsOneWidget);
      },
    );
  });
}
