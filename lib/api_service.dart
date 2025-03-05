import 'dart:convert';

import 'package:http/http.dart' as http;

String fetchBooksUrl =
    'https://raw.githubusercontent.com/Richa0305/mock-json/main/book.json';

Future<List<BooksListModel>> fetchBooks(http.Client client) async {
  final response = await client.get(Uri.parse(fetchBooksUrl));

  if (response.statusCode == 200) {
    return List<BooksListModel>.from(
      jsonDecode(response.body).map((x) => BooksListModel.fromJson(x)),
    );
  } else {
    throw Exception('Failed to load books');
  }
}

class BooksListModel {
  String name;
  String author;
  String? description;
  String? amazon;

  BooksListModel({
    required this.name,
    required this.author,
    this.description,
    this.amazon,
  });

  factory BooksListModel.fromJson(Map<String, dynamic> json) => BooksListModel(
    name: json['name'],
    author: json['auther'],
    description: json['description'],
    amazon: json['amazon'],
  );
}
