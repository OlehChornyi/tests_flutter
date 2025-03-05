import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tests_flutter/login_screen.dart';

void main() {
  testWidgets('Should have a title', (WidgetTester tester) async {
    //Arrange
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    //Act
    Finder title = find.text("Login");

    //Assert
    expect(title, findsNWidgets(2));
  });

  testWidgets('Should have a text field to collect email id', (
    WidgetTester tester,
  ) async {
    //Arrange
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    //Act
    Finder userNameTextField = find.byKey(const ValueKey('email_id'));

    //Assert
    expect(userNameTextField, findsOneWidget);
  });

  testWidgets('Should have a text field to collect password', (
    WidgetTester tester,
  ) async {
    //Arrange
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    //Act
    Finder passwordTextField = find.byKey(const ValueKey('password'));

    //Assert
    expect(passwordTextField, findsOneWidget);
  });

  testWidgets('Should have a loggin button', (WidgetTester tester) async {
    //Arrange
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    //Act
    Finder loginButton = find.byType(ElevatedButton);

    //Assert
    expect(loginButton, findsOneWidget);
  });

  testWidgets('Should show required fields text message if fields are empty', (
    WidgetTester tester,
  ) async {
    //Arrange
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    //Act
    Finder loginButton = find.byType(ElevatedButton);
    await tester.tap(loginButton);
    await tester.pumpAndSettle();
    Finder errorTexts = find.text('Required Field');

    //Assert
    expect(errorTexts, findsNWidgets(2));
  });

  testWidgets('Should submit form when user email id and password are valid', (
    WidgetTester tester,
  ) async {
    //Arrange
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    //Act
    Finder userNameTextField = find.byKey(const ValueKey('email_id'));
    Finder passwordTextField = find.byKey(const ValueKey('password'));
    await tester.enterText(userNameTextField, 'i@i.com');
    await tester.enterText(passwordTextField, '12345678');

    Finder loginButton = find.byType(ElevatedButton);
    await tester.tap(loginButton);
    await tester.pumpAndSettle();
    Finder errorTexts = find.text('Required Field');

    //Assert
    expect(errorTexts, findsNothing);
  });
}
