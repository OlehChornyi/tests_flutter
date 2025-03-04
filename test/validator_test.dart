import 'package:test/scaffolding.dart';
import 'package:test/test.dart';
import 'package:tests_flutter/validator.dart';

void main() {
  test('Validate for an empty email id', () {
    //Arrange & Act
    var result = Validator.validateEmail('');

    //Assert
    expect(result, 'Required Field');
  });

  test('Validate for an invalid email id', () {
    //Arrange & Act
    var result = Validator.validateEmail('adfsfjkshfjhsdf');

    //Assert
    expect(result, 'Please enter a valid email id');
  });

  test('Validate for a valid email id', () {
    //Arrange & Act
    var result = Validator.validateEmail('i@i.com');

    //Assert
    expect(result, null);
  });

  test('Validate for an empty password', () {
    //Arrange & Act
    var result = Validator.validatePassword('');

    //Assert
    expect(result, 'Required Field');
  });

  test('Validate for an invalid password', () {
    //Arrange & Act
    var result = Validator.validatePassword('asfd');

    //Assert
    expect(result, 'Please enter at least 8 characters');
  });

  test('Validate for a valid password', () {
    //Arrange & Act
    var result = Validator.validatePassword('password');

    //Assert
    expect(result, null);
  });
}
