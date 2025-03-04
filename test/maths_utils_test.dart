import 'package:tests_flutter/maths_utils.dart';
import 'package:test/test.dart';

void main() {
  group('Math utils tests', () {
    test('Check for two numbers addition', () {
      //Arrange
      var a = 10;
      var b = 10;

      //Act
      var sum = add(a, b);

      //Assert
      expect(sum, 20);
    });

    test('Check for two numbers substraction', () {
      //Arrange
      var a = 10;
      var b = 10;

      //Act
      var subs = substract(a, b);

      //Assert
      expect(subs, 00);
    });

    test('Check for two numbers multiplication', () {
      //Arrange
      var a = 10;
      var b = 10;

      //Act
      var mult = multiply(a, b);

      //Assert
      expect(mult, 100);
    });
  });
}
