import 'package:codeveggie/Models/RecipeModel.dart';
import 'package:codeveggie/secrets.dart';
import 'package:http/http.dart' as http;

class RecipeService {
  Future<Recipe?> getFoodData(String query, int num) async {
    final String url =
        "https://api.spoonacular.com/recipes/complexSearch?query=${query}&apiKey=${RECIPE_API_KEY}&instructionsRequired=true&addRecipeInformation=true&${num}=10";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.body.length);
      return recipeFromJson(response.body);
    } else {
      return null;
    }
  }
}
