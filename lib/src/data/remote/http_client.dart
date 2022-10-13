import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:knowledge_queezy/src/data/remote/responses/category_response.dart';
import 'package:knowledge_queezy/src/data/remote/responses/quiz_response.dart';
import 'package:knowledge_queezy/src/models/category_model.dart';
import 'package:knowledge_queezy/src/models/quiz_model.dart';

final httpClientProvider = Provider<HttpClient>((ref) {
  return HttpClient();
});

class HttpClient {
  Future<List<CategoryModel>> getCategories() async {
    final http.Client client = http.Client();

    final http.Response response = await client.get(Uri.https("opentdb.com", "/api_category.php"));

    if (response.statusCode != 200) {
      throw Exception("Error ${response.statusCode}");
    }

    Map<String, dynamic> responseBody = jsonDecode(response.body);

    final CategoryResponse categoryResponse = CategoryResponse.fromJson(responseBody);
    return categoryResponse.categories;
  }

  Future<List<QuizModel>> getQuizzes({
    required CategoryModel category,
    required String difficulty,
  }) async {
    final http.Client client = http.Client();

    Map<String, String> parameters = {
      "amount": "10",
      "category": category.id.toString(),
      "difficulty": difficulty.toLowerCase(),
    };

    final http.Response response = await client.get(
      Uri.https("opentdb.com", "/api.php", parameters),
    );

    if (response.statusCode != 200) {
      throw Exception("Error ${response.statusCode}");
    }

    Map<String, dynamic> responseBody = jsonDecode(response.body);
    final QuizResponse quizResponse = QuizResponse.fromJson(responseBody);
    if (quizResponse.responseCode != 0) {
      throw Exception("Error ${quizResponse.responseCode}");
    }
    if (quizResponse.results.isEmpty) {
      throw Exception("Empty!");
    }
    return quizResponse.results;
  }
}
