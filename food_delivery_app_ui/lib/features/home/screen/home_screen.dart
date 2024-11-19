import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/common/widget/custom_drawer.dart';
import 'package:food_delivery_app_ui/features/category/food_product/model/food_product_data.dart';
import 'package:food_delivery_app_ui/features/category/food_product/screen/food_product_screen.dart';
import 'package:food_delivery_app_ui/features/category/foood_category/model/food_category_data.dart';
import 'package:food_delivery_app_ui/features/category/foood_category/screen/food_category_screen.dart';
import 'package:food_delivery_app_ui/features/category/restaurant/screen/restaurant_category_screen.dart';
import 'package:food_delivery_app_ui/features/category/restaurant/screen/restaurant_screen.dart';
import 'package:food_delivery_app_ui/utils/dimensions.dart';
import 'package:get/get.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';

import '../../card/screen/card_screen.dart';
import '../../category/foood_category/widget/custom_all_category_food_single_container.dart';
import '../../../common/widget/custom_app_bar.dart';
import '../../category/restaurant/widget/custom_restaurant_widget.dart';
import '../../../common/widget/custom_search_box.dart';
import '../../../utils/app_color.dart';
import '../../../utils/images.dart';
import '../../category/restaurant/model/restaurant_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
   Color leadingBGColor = AppColor.whiteTwo;

   Color leadingIconColor = AppColor.black;

   Color titleColor = AppColor.orange;

   Color suffixBGColor = AppColor.darkBlue;

   Color suffixIconColor = AppColor.white;

   IconData leadingIcon = Icons.format_align_left;

   IconData subTitleIcon = Icons.arrow_drop_down;

   IconData prefixIcon = Icons.search;

   IconData suffixIcon = Icons.card_travel;

   String title = "DELIVER TO";

   String subTitle = "Halal Lab Office";

   String hintText = "search dishes, restaurants";

   int number = 2;

/*
List<RestaurantData>restaurantList = [
     RestaurantData(
       restaurantId: 1,
       restaurantName: "A Restaurant",
       deliveryType: "Free",
       duration: 45,
       restaurantRating: 4.5,
       //restaurantImageList: ,
       //restaurantFoodCategoryList: ,
       //restaurantFoodProductList: ,
     ),
     RestaurantData(
       restaurantId: 2,
       restaurantName: "B Restaurant",
       deliveryType: "Free",
       duration: 40,
       restaurantRating: 4.0,
       //restaurantImageList: ,
       //restaurantFoodCategoryList: ,
       //restaurantFoodProductList: ,
     ),
   ];
 */
  List<RestaurantData>restaurantList = [
    RestaurantData(
      restaurantId: 1,
      restaurantName: "A Restaurant",
      deliveryType: "Free",
      duration: 45,
      restaurantReview: 4.5,
      restaurantImageList: [
        Images.cover1,
        Images.onBoarding1
      ],
      restaurantFoodCategoryList: [
        FoodCategoryData(
          foodCategoryId: 1,
            foodCategoryName: "Pizza",
            restaurantFoodProductList: [
                FoodProductData(image: Images.pizza1,productName: "Pizza Pizza 1", productPrice: 100, foodCategoryId: 1),
                FoodProductData(image: Images.pizza2,productName: "Pizza Pizza 2", productPrice: 150, foodCategoryId: 1),
                FoodProductData(image: Images.pizza3,productName: "Pizza Pizza 3", productPrice: 120, foodCategoryId: 1),
            ],
        ),
        FoodCategoryData(
          foodCategoryId: 2,
            foodCategoryName: "Burger",
            restaurantFoodProductList: [
              FoodProductData(image: Images.burger1,productName: "Burger Burger 1", productPrice: 100),
              FoodProductData(image: Images.burger2,productName: "Burger Burger 2", productPrice: 150),
              FoodProductData(image: Images.burger3,productName: "Burger Burger 3", productPrice: 100),
            ],
        ),
        FoodCategoryData(
          foodCategoryId: 3,
            foodCategoryName: "Sub Sandwich",
            restaurantFoodProductList: [
              FoodProductData(image: Images.sub1,productName: "Sub Sandwich 1", productPrice: 80),
              FoodProductData(image: Images.sub2,productName: "Sub Sandwich 2", productPrice: 110),
              FoodProductData(image: Images.sub3,productName: "Sub Sandwich 3", productPrice: 100),
            ],
        ),
        FoodCategoryData(
          foodCategoryId: 4,
            foodCategoryName: "Fried Rice",
            restaurantFoodProductList: [
              FoodProductData(image: Images.rice1,productName: "Fried Rice 1", productPrice: 80, foodCategoryId: 2),
              FoodProductData(image: Images.rice2,productName: "Fried Rice 2", productPrice: 110, foodCategoryId: 2),
              FoodProductData(image: Images.rice3,productName: "Fried Rice 3", productPrice: 100, foodCategoryId: 2),
            ],
        ),
      ],

    ),
    RestaurantData(
      restaurantId: 2,
      restaurantName: "B Restaurant",
      deliveryType: "Free",
      duration: 40.0,
      restaurantReview: 4.0,
      restaurantImageList: [
        Images.cover2,
        Images.onBoarding2
      ],
      restaurantFoodCategoryList: [
        FoodCategoryData(
          foodCategoryId: 1,
          foodCategoryName: "Pizza",
          restaurantFoodProductList: [
            FoodProductData(image: Images.pizza4,productName: "Pizza Pizza 5", productPrice: 100, foodCategoryId: 1),
            FoodProductData(image: Images.pizza2,productName: "Pizza Pizza 2", productPrice: 150, foodCategoryId: 1),
            FoodProductData(image: Images.pizza3,productName: "Pizza Pizza 3", productPrice: 120, foodCategoryId: 1),
            FoodProductData(image: Images.pizza1,productName: "Pizza Pizza 1", productPrice: 100, foodCategoryId: 1),
          ],
        ),
        FoodCategoryData(
          foodCategoryId: 2,
            foodCategoryName: "Burger",
            restaurantFoodProductList: [
              FoodProductData(image: Images.burger4,productName: "Burger Burger 4", productPrice: 100, foodCategoryId: 2),
              FoodProductData(image: Images.burger2,productName: "Burger Burger 2", productPrice: 150, foodCategoryId: 2),
              FoodProductData(image: Images.burger3,productName: "Burger Burger 3", productPrice: 100, foodCategoryId: 2),
            ],
        ),
        FoodCategoryData(
          foodCategoryId: 3,
            foodCategoryName: "Sub Sandwich",
            restaurantFoodProductList: [
              FoodProductData(image: Images.sub4,productName: "Sub Sandwich 4", productPrice: 80, foodCategoryId: 3),
              FoodProductData(image: Images.sub2,productName: "Sub Sandwich 2", productPrice: 110, foodCategoryId: 3),
              FoodProductData(image: Images.sub3,productName: "Sub Sandwich 3", productPrice: 100, foodCategoryId: 3),
            ],
        ),
        FoodCategoryData(
          foodCategoryId: 4,
            foodCategoryName: "Fried Rice",
            restaurantFoodProductList: [
              FoodProductData(image: Images.rice4,productName: "Fried Rice 4", productPrice: 80, foodCategoryId: 4),
              FoodProductData(image: Images.rice2,productName: "Fried Rice 2", productPrice: 110, foodCategoryId: 4),
              FoodProductData(image: Images.rice3,productName: "Fried Rice 3", productPrice: 100, foodCategoryId: 4),
            ],
        ),
      ],
      //restaurantFoodProductList: ,
    ),
    RestaurantData(
      restaurantId: 3,
      restaurantName: "C Restaurant",
      deliveryType: "Free",
      duration: 40.0,
      restaurantReview: 4.0,
      restaurantImageList: [
        Images.cover3,
        Images.onBoarding3
      ],
      restaurantFoodCategoryList: [
        FoodCategoryData(
          foodCategoryId: 1,
          foodCategoryName: "Pizza",
          restaurantFoodProductList: [
            FoodProductData(image: Images.pizza4,productName: "Pizza Pizza 5", productPrice: 100, foodCategoryId: 1),
            FoodProductData(image: Images.pizza2,productName: "Pizza Pizza 2", productPrice: 150, foodCategoryId: 1),
            FoodProductData(image: Images.pizza3,productName: "Pizza Pizza 3", productPrice: 120, foodCategoryId: 1),
            FoodProductData(image: Images.pizza1,productName: "Pizza Pizza 1", productPrice: 100, foodCategoryId: 1),
          ],
        ),
        FoodCategoryData(
          foodCategoryId: 2,
          foodCategoryName: "Burger",
          restaurantFoodProductList: [
            FoodProductData(image: Images.burger4,productName: "Burger Burger 4", productPrice: 100, foodCategoryId: 2),
            FoodProductData(image: Images.burger2,productName: "Burger Burger 2", productPrice: 150, foodCategoryId: 2),
            FoodProductData(image: Images.burger3,productName: "Burger Burger 3", productPrice: 100, foodCategoryId: 2),
          ],
        ),
        FoodCategoryData(
          foodCategoryId: 3,
          foodCategoryName: "Sub Sandwich",
          restaurantFoodProductList: [
            FoodProductData(image: Images.sub4,productName: "Sub Sandwich 4", productPrice: 80, foodCategoryId: 3),
            FoodProductData(image: Images.sub2,productName: "Sub Sandwich 2", productPrice: 110, foodCategoryId: 3),
            FoodProductData(image: Images.sub3,productName: "Sub Sandwich 3", productPrice: 100, foodCategoryId: 3),
          ],
        ),
        FoodCategoryData(
          foodCategoryId: 4,
          foodCategoryName: "Fried Rice",
          restaurantFoodProductList: [
            FoodProductData(image: Images.rice4,productName: "Fried Rice 4", productPrice: 80, foodCategoryId: 4),
            FoodProductData(image: Images.rice2,productName: "Fried Rice 2", productPrice: 110, foodCategoryId: 4),
            FoodProductData(image: Images.rice3,productName: "Fried Rice 3", productPrice: 100, foodCategoryId: 4),
          ],
        ),
      ],
      //restaurantFoodProductList: ,
    ),
  ];

  List<FoodCategoryData> foodCategoryList=[
    FoodCategoryData(
      restaurantId: 1,
      foodCategoryId: 1,
      foodCategoryImage: Images.pizza1,
      foodCategoryName: "Pizza",
      startingPrice: 80,
    ),
    FoodCategoryData(
      restaurantId: 1,
      foodCategoryId: 2,
      foodCategoryImage: Images.burger1,
      foodCategoryName: "Burger",
      startingPrice: 180,
    ),
    FoodCategoryData(
      restaurantId: 1,
      foodCategoryId: 3,
      foodCategoryImage: Images.sub1,
      foodCategoryName: "Sub Sandwich",
      startingPrice: 40,
    ),
    FoodCategoryData(
      restaurantId: 1,
      foodCategoryId: 4,
      foodCategoryImage: Images.rice1,
      foodCategoryName: "Fried Rice",
      startingPrice: 120,
    ),

    FoodCategoryData(
      restaurantId: 2,
      foodCategoryId: 1,
      foodCategoryImage: Images.pizza1,
      foodCategoryName: "Pizza",
      startingPrice: 80,
    ),
    FoodCategoryData(
      restaurantId: 2,
      foodCategoryId: 2,
      foodCategoryImage: Images.burger1,
      foodCategoryName: "Burger",
      startingPrice: 180,
    ),
    FoodCategoryData(
      restaurantId: 2,
      foodCategoryId: 3,
      foodCategoryImage: Images.sub1,
      foodCategoryName: "Sub Sandwich",
      startingPrice: 40,
    ),
    FoodCategoryData(
      restaurantId: 2,
      foodCategoryId: 4,
      foodCategoryImage: Images.rice1,
      foodCategoryName: "Fried Rice",
      startingPrice: 120,
    ),
  ];

  List<FoodProductData> foodProductList=[
    FoodProductData(
        restaurantId: 1,
        foodCategoryId: 1,
        productName: "Pizza A",
        image: Images.pizza1,
        deliveryType: "free",
        details: " Pizza A Pizza 1",
        duration: 20,
        productPrice: 120,
        foodReview: 5.5,
        sizes: [
          8,10,12,14
        ]
    ),
    FoodProductData(
        restaurantId: 1,
        foodCategoryId: 1,
        productName: "Pizza B",
        //restaurantName: "Pizza Calzone European",
        image: Images.pizza2,
        deliveryType: "free",
        details: "Pizza B Pizza 2",
        duration: 35,
        productPrice: 100,
        foodReview: 5.0,
        sizes: [
          8,10,12,14
        ]
    ),

    FoodProductData(
        restaurantId: 2,
        foodCategoryId: 1,
        productName: "Pizza A2",
        image: Images.pizza3,
        deliveryType: "free",
        details: "Pizza A2 Pizza 3",
        duration: 20,
        productPrice: 120,
        foodReview: 5.5,
        sizes: [
          8,10,12,14
        ]
    ),
    FoodProductData(
        restaurantId: 2,
        foodCategoryId: 1,
        productName: "Pizza B2",
        //restaurantName: "Pizza Calzone European",
        image: Images.pizza4,
        deliveryType: "free",
        details: "Pizza B2 Pizza 4",
        duration: 30,
        productPrice: 100,
        foodReview: 5.0,
        sizes: [
          8,10,12,14
        ]
    ),
//.........................
    FoodProductData(
        restaurantId: 1,
        foodCategoryId: 2,
        productName: "Burger A",
        image: "",
        deliveryType: "free",
        details: "",
        duration: 20,
        productPrice: 120,
        foodReview: 5.5,
        sizes: [
          8,10,12,14
        ]
    ),
    FoodProductData(
        restaurantId: 1,
        foodCategoryId: 2,
        productName: "Burger B",
        //restaurantName: "Pizza Calzone European",
        image: Images.burger1,
        deliveryType: "free",
        details: "Burger B Burger 1",
        duration: 30,
        productPrice: 100,
        foodReview: 5.0,
        sizes: [
          8,10,12,14
        ]
    ),

    FoodProductData(
        restaurantId: 2,
        foodCategoryId: 2,
        productName: "Burger A2",
        image: Images.burger2,
        deliveryType: "free",
        details: "Burger A2 Burger 2",
        duration: 20,
        productPrice: 120,
        foodReview: 5.5,
        sizes: [
          8,10,12,14
        ]
    ),
    FoodProductData(
        restaurantId: 2,
        foodCategoryId: 2,
        productName: "Burger B2",
        //restaurantName: "Pizza Calzone European",
        image: Images.burger3,
        deliveryType: "free",
        details: "Burger B2 burger 3",
        duration: 30,
        productPrice: 100,
        foodReview: 5.0,
        sizes: [
          8,10,12,14
        ]
    ),
//..........................
    FoodProductData(
        restaurantId: 1,
        foodCategoryId: 3,
        productName: "Sub A",
        image: Images.sub1,
        deliveryType: "free",
        details: "Sub A Sub 1",
        duration: 20,
        productPrice: 120,
        foodReview: 5.5,
        sizes: [
          8,10,12,14
        ]
    ),
    FoodProductData(
        restaurantId: 1,
        foodCategoryId: 3,
        productName: "Sub B",
        //restaurantName: "Pizza Calzone European",
        image: Images.sub2,
        deliveryType: "free",
        details: "Sub B Sub 2",
        duration: 30,
        productPrice: 100,
        foodReview: 5.0,
        sizes: [
          8,10,12,14
        ]
    ),

    FoodProductData(
        restaurantId: 2,
        foodCategoryId: 3,
        productName: "Sub A2",
        image: Images.sub3,
        deliveryType: "free",
        details: "Sub A2 sub 3",
        duration: 20,
        productPrice: 120,
        foodReview: 5.5,
        sizes: [
          8,10,12,14
        ]
    ),
    FoodProductData(
        restaurantId: 2,
        foodCategoryId: 3,
        productName: "Sub B2",
        //restaurantName: "Pizza Calzone European",
        image: Images.sub4,
        deliveryType: "free",
        details: "Sub B2 Sub 4",
        duration: 30,
        productPrice: 100,
        foodReview: 5.0,
        sizes: [
          8,10,12,14
        ]
    ),
//........................
    FoodProductData(
        restaurantId: 1,
        foodCategoryId: 4,
        productName: "Fried Rice A",
        image: Images.rice1,
        deliveryType: "free",
        details: "Fried Rice A Rice 1",
        duration: 20,
        productPrice: 120,
        foodReview: 5.5,
        sizes: [
          8,10,12,14
        ]
    ),
    FoodProductData(
        restaurantId: 1,
        foodCategoryId: 4,
        productName: "Fried Rice B",
        //restaurantName: "Pizza Calzone European",
        image: Images.rice2,
        deliveryType: "free",
        details: "Fried Rice B Rice 2",
        duration: 30,
        productPrice: 100,
        foodReview: 5.0,
        sizes: [
          8,10,12,14
        ]
    ),

    FoodProductData(
        restaurantId: 2,
        foodCategoryId: 4,
        productName: "Fried Rice A2",
        image: Images.rice3,
        deliveryType: "free",
        details: "",
        duration: 20,
        productPrice: 120,
        foodReview: 5.5,
        sizes: [
          8,10,12,14
        ]
    ),
    FoodProductData(
        restaurantId: 2,
        foodCategoryId: 4,
        productName: "Fried Rice B2",
        //restaurantName: "Pizza Calzone European",
        image: Images.rice4,
        deliveryType: "free",
        details: "Fried Rice B2 Rice 4",
        duration: 30,
        productPrice: 100,
        foodReview: 5.0,
        sizes: [
          8,10,12,14
        ]
    ),

  ];

  // TabController _tabController;
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _motionTabBarController!.dispose();
  }

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: const CustomDrawer(),
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.symmetric(vertical: 30),
           //padding: const EdgeInsets.only(top: Dimensions.paddingSizeTwentyFive, left: Dimensions.paddingSizeTwentyFive, right: Dimensions.paddingSizeTwentyFive),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomAppBar(
                  leadingBGColor: leadingBGColor,
                  leadingIcon: leadingIcon,
                  leadingIconColor: leadingIconColor,
                  title: title,
                  subTitle: subTitle,
                  subTitleIcon: subTitleIcon,
                  number: number,
                  titleColor: titleColor,
                  suffixBGColor: suffixBGColor,
                  suffixIcon: suffixIcon,
                  suffixIconColor: suffixIconColor,
                  onTapCard: () {
                    Get.to(const CardScreen());
                  },
                  onTapButton: () {
                    //drawer
                    _globalKey.currentState!.openDrawer();
                  },
                ),
              ),
              const SizedBox(height: Dimensions.marginSizeTen),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  text: const TextSpan(
                    text: "Hey Halal, ",
                    style: TextStyle(color: AppColor.black),
                    children: [
                      TextSpan(
                        text: "Good Afternoon!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: AppColor.black),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: Dimensions.marginSizeTen),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomSearchBox(hintText: hintText, prefixIcon: prefixIcon),
              ),
              const SizedBox(height: Dimensions.marginSizeTen),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Row(

                  children: [
                    const Text("All Categories", style: TextStyle(fontSize: 15)),
                    const Spacer(),
                    InkWell(
                      onTap: (){
                        Get.to(FoodCategoryScreen(foodCategoryList: foodCategoryList,));
                      },
                      child: const Row(
                        children: [
                          Text("see all"),
                          SizedBox(width: 4),
                          Icon(Icons.arrow_forward_ios_rounded,
                              size: 15, color: Colors.grey),
                        ],
                      ),
                    ),

                  ],
                               ),
               ),
              const SizedBox(height: Dimensions.marginSizeTen),
              SizedBox(
                  height: 170,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 20),
                    itemCount: foodCategoryList.length,
                    itemBuilder: (context, index) {
                      return CustomAllCategoryFoodSingleContainer(
                        foodImage: foodCategoryList[index].foodCategoryImage!,
                        foodName: foodCategoryList[index].foodCategoryName!,
                        price: foodCategoryList[index].startingPrice,
                        onTapFoodCategory: () {
                          Get.to(FoodProductScreen(foodCategoryData: foodCategoryList[index],) );
                        },
                      );
                    },
                  ),
                ),
              const SizedBox(height: Dimensions.marginSizeTen),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Text("Open Restaurants", style: TextStyle(fontSize: 15)),
                    const Spacer(),
                    InkWell(
                      onTap: (){
                        Get.to(RestaurantCategoryScreen(restaurantList: restaurantList,));
                      },
                      child: const Row(
                        children: [
                          Text("see all"),
                          SizedBox(width: 4),
                          Icon(Icons.arrow_forward_ios_rounded,
                              size: 15, color: Colors.grey),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  shrinkWrap: true, // Ensures the list takes up only the needed space
                  physics: const NeverScrollableScrollPhysics(), // Disables scrolling for this ListView
                  itemCount: restaurantList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: CustomRestaurantWidget(
                        restaurantImage: restaurantList[index].restaurantImageList![0],
                        restaurantName: restaurantList[index].restaurantName!,
                        foodCategoryList: restaurantList[index].restaurantFoodCategoryList!,
                        restaurantReview: restaurantList[index].restaurantReview!,
                        shippingStatus: restaurantList[index].deliveryType!,
                        durationTime: restaurantList[index].duration!,
                      ),
                      onTap: (){
                        Get.to(RestaurantScreen(restaurantData: restaurantList[index]));
                      },
                    );
                  },
                ),
              ),
            ],
                     ),
         ),
      ),
    );
  }
}
