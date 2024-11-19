import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/common/widget/custom_asset_image.dart';
import 'package:food_delivery_app_ui/common/widget/custom_container_icon.dart';
import 'package:food_delivery_app_ui/features/card/screen/card_screen.dart';
import 'package:food_delivery_app_ui/features/category/food_product/model/food_product_data.dart';
import 'package:food_delivery_app_ui/features/category/food_product/widget/custom_product_container.dart';
import 'package:food_delivery_app_ui/features/category/restaurant/model/restaurant_data.dart';
import 'package:food_delivery_app_ui/utils/app_color.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';


class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key, this.restaurantData});
  final RestaurantData? restaurantData;

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  int? selectedCategoryId; // Track the selected category
  List<FoodProductData>?
      filteredProducts; // Filtered products based on the selected category

  @override
  void initState() {
    super.initState();
    _filterProductsByCategory(null); // Show all products initially
  }

  void _filterProductsByCategory(int? categoryId) {
    setState(() {
      selectedCategoryId = categoryId;
      if (categoryId == null) {
        // Show all products if no category is selected
        filteredProducts = widget.restaurantData?.restaurantFoodCategoryList
            ?.expand((category) => category.restaurantFoodProductList ?? [])
            .cast<FoodProductData>()
            .toList();
      } else {
        // Show products of the selected category
        filteredProducts = widget.restaurantData?.restaurantFoodCategoryList
            ?.where((category) => category.foodCategoryId == categoryId)
            .expand((category) => category.restaurantFoodProductList ?? [])
            .cast<FoodProductData>()
            .toList();
      }
    });
  }

  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    double? restaurantReview = widget.restaurantData?.restaurantReview;
    String? shippingStatus = widget.restaurantData?.deliveryType;
    double? durationTime = widget.restaurantData?.duration;
    String? restaurantName = widget.restaurantData?.restaurantName;

    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Restaurant Header
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.33,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
                child: Stack(children: [
                  Expanded(
                    child: CarouselSlider(
                      items: widget.restaurantData?.restaurantImageList?.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return SizedBox(
                                height: MediaQuery.of(context).size.height * 0.35,
                                width: MediaQuery.of(context).size.width,
                                child: CustomAssetImage(
                                  image: i,
                                  fit: BoxFit.cover,
                                ));
                          },
                        );
                      }).toList(),
                      carouselController: _controller,
                      options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          viewportFraction: 1.0,
                          height: MediaQuery.of(context).size.height * 0.35,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.restaurantData!.restaurantImageList!
                          .asMap()
                          .entries
                          .map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 12.0,
                            height: 12.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.white)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: const CustomContainerIcon(
                            bgColor: AppColor.whiteTwo,
                            icon: Icons.arrow_back_ios_new,
                            iconColor: AppColor.black,
                          ),
                        ),
                        const CustomContainerIcon(
                          bgColor: AppColor.whiteTwo,
                          icon: Icons.more_horiz,
                          iconColor: AppColor.black,
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            const SizedBox(height: 15),

            // Restaurant Details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: AppColor.orange, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      '$restaurantReview',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.local_shipping,
                        color: AppColor.orange, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      shippingStatus ?? 'Unknown',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.access_time,
                        color: AppColor.orange, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      '$durationTime mins',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                restaurantName ?? 'Unknown Restaurant',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sollicitudin posuere ultricies.",
              ),
            ),
            const SizedBox(height: 15),

            // Category List
            SizedBox(
              height: 40,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        _filterProductsByCategory(null);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 7),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: selectedCategoryId == null
                              ? AppColor.orange
                              : Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: const Text(
                          "All",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.restaurantData?.restaurantFoodCategoryList
                              ?.length ??
                          0,
                      itemBuilder: (context, index) {
                        final category = widget
                            .restaurantData!.restaurantFoodCategoryList![index];
                        return InkWell(
                          onTap: () {
                            _filterProductsByCategory(category.foodCategoryId);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 7),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: selectedCategoryId == category.foodCategoryId
                                  ? AppColor.orange
                                  : Colors.white,
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            child: Text(
                              category.foodCategoryName ?? 'Category',
                              style: TextStyle(
                                color:
                                    selectedCategoryId == category.foodCategoryId
                                        ? Colors.white
                                        : Colors.black,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Product Grid
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 15),
              child: GridView.builder(
                itemCount: filteredProducts?.length ?? 0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 12 / 15.5,
                ),
                itemBuilder: (context, i) {
                  final product = filteredProducts?[i];
                  return CustomProductContainer(
                    foodImage: product?.image ?? '',
                    foodName: product?.productName ?? 'Unknown',
                    restaurantName: restaurantName ?? 'Restaurant',
                    price: product?.productPrice ?? 0.0,
                    onPressedCardIcon: () {
                      Get.to(
                        CardScreen(
                          foodProductData: FoodProductData(
                            image: product?.image,
                            productName: product?.productName,
                            productPrice: product?.productPrice,
                            quantity: 1,
                          ),
                          price: product?.productPrice,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
