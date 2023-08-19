import 'package:get/get.dart';
import 'package:news_api/NewsApi/model/news_model.dart';
import 'package:news_api/Utils/api_helper.dart';

class NewsController extends GetxController {
  Future<NewsModel> getdata() async {
    NewsModel n1 = await ApiHelper.helper.getApi();
    return n1;
  }
}
