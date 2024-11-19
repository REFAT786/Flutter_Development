class FoodProductData {
  double? productPrice;
  int ?foodCategoryId, restaurantId, quantity;
  double? foodReview, duration;
  String? image, details, productName, deliveryType;
  List<int>? sizes;
  FoodProductData({
    this.restaurantId,
    this.foodCategoryId,
    this.deliveryType,
    this.details,
    this.duration,
    this.image,
    this.productName,
    this.productPrice,
    this.foodReview,
    this.sizes,
    this.quantity
  });
}
