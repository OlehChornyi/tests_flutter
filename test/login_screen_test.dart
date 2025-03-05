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
    expect(title, findsOneWidget);
  });
}
