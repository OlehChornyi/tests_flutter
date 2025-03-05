import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:tests_flutter/api_service.dart';

import 'fetch_books_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient(); 
  });

  tearDown(() {
    mockClient.close();
  });

  group('Fetch books api call test', () {
    test('Should return list of books for http call', () async {
      //Arrange
      // final mockClient = MockClient();

      when(mockClient.get(Uri.parse(fetchBooksUrl))).thenAnswer(
        (realInvocation) async =>
            http.Response('[{"name": "1", "auther": "1"}]', 200),
      );

      //Act & Assert
      expect(await fetchBooks(mockClient), isA<List<BooksListModel>>());
    });

    test(
      'Should throw an exception when api call finishes with error',
      () {
        //Arrange
        // final mockClient = MockClient();

        when(
          mockClient.get(Uri.parse(fetchBooksUrl)),
        ).thenAnswer((realInvocation) async => http.Response('Not found', 404));

        //Act & Assert
        expect(fetchBooks(mockClient), throwsException);
      },
    );
  });
}
