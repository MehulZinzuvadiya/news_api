import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_api/NewsApi/model/news_model.dart';

class ApiHelper {
  static final helper = ApiHelper._();

  ApiHelper._();

  Future<NewsModel> getApi() async {
    String link =
        "https://newsapi.org/v2/everything?q=uk&from=2023-07-20&sortBy=publishedAt&apiKey=98aff2f401254f4fb17b96a2ff5a00af";
    var response = await http.get(Uri.parse(link));
    var json = jsonDecode(response.body);
    NewsModel newsModel = NewsModel.fromMap(json);
    return newsModel;
  }
}
