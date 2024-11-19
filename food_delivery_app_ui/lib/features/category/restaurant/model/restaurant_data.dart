
import '../../foood_category/model/food_category_data.dart';

class RestaurantData {
  int? restaurantId;
  String? restaurantName;
  double? restaurantReview, duration;
  String? deliveryType;

  List<String>? restaurantImageList;
  List<FoodCategoryData>? restaurantFoodCategoryList;


  RestaurantData({
      this.restaurantId,
      this.restaurantImageList,
      this.restaurantFoodCategoryList,
      this.restaurantName,
      this.deliveryType,
      this.duration,
      this.restaurantReview});
}
