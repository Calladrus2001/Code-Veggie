import 'package:codeveggie/Models/FoodModel.dart';
import 'package:codeveggie/secrets.dart';
import 'package:http/http.dart' as http;

class FoodService {
  Future<Food?> getFoodData(String query) async {
    final String url =
        "https://api.nal.usda.gov/fdc/v1/foods/search?api_key=${FOOD_API_KEY}&query=${query}&pageSize=7&requireAllWords=true";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return foodFromJson(response.body);
    } else {
      return null;
    }
  }
}
