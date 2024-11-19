
import '../../food_product/model/food_product_data.dart';

class FoodCategoryData {
  int? foodCategoryId, restaurantId;
  String? foodCategoryImage, foodCategoryName;
  double? startingPrice;
  List<FoodProductData>? restaurantFoodProductList;

  FoodCategoryData({this.foodCategoryId, this.foodCategoryName, this.foodCategoryImage, this.startingPrice, this.restaurantId, this.restaurantFoodProductList});
}
