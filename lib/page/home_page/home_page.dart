import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_comfort_food/constant/color_constant.dart';
import 'package:your_comfort_food/constant/image_constant.dart';
import 'package:your_comfort_food/constant/text_style_constant.dart';
import 'package:your_comfort_food/page/home_page/home_page_view_model.dart';
import 'package:your_comfort_food/page/home_page/widgets/recipe_all.dart';
import 'package:your_comfort_food/page/home_page/widgets/recipe_dairy_free.dart';
import 'package:your_comfort_food/page/home_page/widgets/recipe_vegan.dart';
import 'package:your_comfort_food/page/home_page/widgets/search_container_widget.dart';
import 'package:your_comfort_food/page/login_page/login_page.dart';
import 'package:your_comfort_food/page/login_page/login_view_model.dart';
import 'package:your_comfort_food/page/search_page/search_page.dart';
import 'package:your_comfort_food/page/search_page/search_page_view_model.dart';
import 'package:your_comfort_food/widgets/button_category_widget.dart';
import 'package:your_comfort_food/widgets/search_text_form_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<LoginPageViewModel>(context, listen: false).getUsername();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomePageViewModel>(context);
    final providerSearch = Provider.of<SearchPageViewModel>(context);
    final providerLogin = Provider.of<LoginPageViewModel>(context);

    return Scaffold(
      backgroundColor: ColorConstant.whitishGray,
      extendBody: true,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        toolbarHeight: 100,
        title: Text(
          'Welcome Back,\n${providerLogin.userName}!',
          style: TextStyleConstant.poppinsRegular
              .copyWith(fontWeight: FontWeight.bold, fontSize: 23),
        ),
        actions: [
          GestureDetector(
            onTap: () {
               showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Log out'),
                  content: const Text('You sure want to log out?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        providerLogin.logOut();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                            (route) => false);
                      },
                      child: const Text('Log Out'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                  ],
                );
              },
            );
            },
            child: Container(
              margin: const EdgeInsets.only(right: 25),
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                  color: ColorConstant.whitishGray,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), //color of shadow
                      spreadRadius: 2.5, //spread radius
                      blurRadius: 3, // blur radius
                      offset: const Offset(0, 0),
                    )
                  ]),
              child: const Icon(Icons.logout),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SearchTextFormWidget(
                      autoFocus: false,
                      width: 295,
                      height: 42,
                      readOnly: true,
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchPage(
                                    autoFocus: true,
                                  ))),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: ColorConstant.orangeColor),
                            borderRadius: BorderRadius.circular(12)),
                        child: IconButton(
                            onPressed: () {
                              provider.refreshRecipe();
                            },
                            icon: Icon(
                              Icons.refresh_rounded,
                              color: ColorConstant.orangeColor,
                              size: 23,
                            )))
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Popular Recipe',
                    style: TextStyleConstant.poppinsRegular
                        .copyWith(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              providerSearch.getBurgerSearchRecipe();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SearchPage(
                                            autoFocus: false,
                                          )));
                            },
                            child: SearchContainerWidGet(
                                title: 'Burger', image: ImageConstant.burger),
                          ),
                          GestureDetector(
                            onTap: () {
                              providerSearch.getFriedChickenSearchRecipe();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SearchPage(
                                            autoFocus: false,
                                          )));
                            },
                            child: SearchContainerWidGet(
                                title: 'Fried Chicken',
                                image: ImageConstant.friedChicken),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              providerSearch.getPizzaSearchRecipe();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SearchPage(
                                            autoFocus: false,
                                          )));
                            },
                            child: SearchContainerWidGet(
                                title: 'Pizza', image: ImageConstant.pizza),
                          ),
                          GestureDetector(
                            onTap: () {
                              providerSearch.getNoodleSearchRecipe();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SearchPage(
                                            autoFocus: false,
                                          )));
                            },
                            child: SearchContainerWidGet(
                                title: 'Noodle', image: ImageConstant.noodle),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'Category',
                    style: TextStyleConstant.poppinsRegular
                        .copyWith(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonCategoryWidget(
                height: 35,
                width: 120,
                text: 'All',
                onTap: () {
                  provider.setAllRecipe();
                },
                color: provider.isAllClicked ? ColorConstant.orangeColor : null,
                textStyle: provider.isAllClicked
                    ? TextStyleConstant.poppinsRegular.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorConstant.whitishGray)
                    : TextStyleConstant.poppinsRegular.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorConstant.orangeColor),
              ),
              const SizedBox(
                width: 12,
              ),
              ButtonCategoryWidget(
                height: 35,
                width: 120,
                text: 'Vegan',
                onTap: () {
                  provider.setVeganRecipe();
                },
                color:
                    provider.isVeganClicked ? ColorConstant.orangeColor : null,
                textStyle: provider.isVeganClicked
                    ? TextStyleConstant.poppinsRegular.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorConstant.whitishGray)
                    : TextStyleConstant.poppinsRegular.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorConstant.orangeColor),
              ),
              const SizedBox(
                width: 12,
              ),
              ButtonCategoryWidget(
                height: 35,
                width: 120,
                text: 'Dairy Free',
                onTap: () {
                  provider.setDairyRecipe();
                },
                color:
                    provider.isDairyClicked ? ColorConstant.orangeColor : null,
                textStyle: provider.isDairyClicked
                    ? TextStyleConstant.poppinsRegular.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorConstant.whitishGray)
                    : TextStyleConstant.poppinsRegular.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorConstant.orangeColor),
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Expanded(child: _buildRecipeGridView(provider.selectRecipe)),
        ],
      ),
    );
  }

  Widget _buildRecipeGridView(RecipeType recipeType) {
    return Consumer<HomePageViewModel>(
      builder: (context, provider, child) {
        switch (recipeType) {
          case RecipeType.all:
            return const RecipeAllGridView();
          case RecipeType.vegan:
            return const RecipeVeganGridView();
          case RecipeType.dairyFree:
            return const RecipeDairyFreeGridView();
        }
      },
    );
  }
}
