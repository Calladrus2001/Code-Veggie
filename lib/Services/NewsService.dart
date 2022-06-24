import 'package:codeveggie/Models/NewsModel.dart';
import 'package:codeveggie/secrets.dart';
import 'package:http/http.dart' as http;

class NewsService {
  Future<News?> getNews() async {
    final String url =
        "https://newsapi.org/v2/everything?q=Pollution&domains=theverge.com,gizmodo.com,nytimes.com,bbc.co.uk&from=2022-06-01&sortBy=popularity&apiKey=08b7f47ff9e24d8abaa5ea5541e86fee&language=en&pageSize=15";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return newsFromJson(response.body);
    } else {
      return null;
    }
  }
}
