import 'package:tests_flutter/maths_utils.dart';
import 'package:test/test.dart';

void main() {
  test('Check for two numbers addition', () {
    //Arrange
    var a = 10;
    var b = 10;

    //Act
    var sum = add(a, b);

    //Assert
    expect(sum, 20);
  });
}