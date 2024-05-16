import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_comfort_food/constant/color_constant.dart';
import 'package:your_comfort_food/constant/constant.dart';
import 'package:your_comfort_food/constant/text_style_constant.dart';
import 'package:your_comfort_food/page/detail_recipe/detail_recipe_view_model.dart';
import 'package:your_comfort_food/page/detail_recipe/widgets/description_recipe.dart';
import 'package:your_comfort_food/page/detail_recipe/widgets/equipment_widget.dart';
import 'package:your_comfort_food/page/detail_recipe/widgets/ingredient_list_view.dart';
import 'package:your_comfort_food/page/detail_recipe/widgets/instruction_recipe.dart';
import 'package:your_comfort_food/page/detail_recipe/widgets/nutrition_content_widget.dart';
import 'package:your_comfort_food/widgets/button_category_widget.dart';
import 'package:your_comfort_food/widgets/loading_widget.dart';
class DetailRecipe extends StatefulWidget {
  final int? idRecipe;
  const DetailRecipe({super.key, required this.idRecipe});

  @override
  State<DetailRecipe> createState() => _DetailRecipeState();
}

class _DetailRecipeState extends State<DetailRecipe> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DetailRecipeViewModel>(context, listen: false)
          .getDetailRecipe(idRecipe: widget.idRecipe);
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DetailRecipeViewModel>(context, listen: false)
          .getNutrition(widget.idRecipe);
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DetailRecipeViewModel>(context, listen: false)
          .getEquipment(widget.idRecipe);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DetailRecipeViewModel>(context);

    var data = provider.detailRecipeResponse;
    if (provider.isLoading) {
      return const LoadingWIdget(width: 50);
    } else if (provider.errorDetail != null) {
      return Center(
        child: Text(provider.errorDetail ?? ''),
      );
    }
    return Scaffold(
      backgroundColor: ColorConstant.whitishGray,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(left: 18),
          decoration: BoxDecoration(
            color: ColorConstant.whitishGray,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 25,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          'Details',
          style: TextStyleConstant.poppinsRegular.copyWith(
              color: ColorConstant.white,
              fontWeight: FontWeight.bold,
              fontSize: 23),
        ),
        centerTitle: true,
        toolbarHeight: 42,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 280,
                margin: const EdgeInsets.only(top: 11),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.4), BlendMode.darken),
                      image: NetworkImage(
                        data?.image ?? noImageUrl,
                      )),
                ),
                child: Container(
                  margin: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 77,
                        height: 30,
                        decoration: BoxDecoration(
                            color: ColorConstant.orangeColor1,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: ColorConstant.orangeColor2,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              data?.spoonacularScore?.toStringAsFixed(1) ?? '',
                              style: TextStyleConstant.poppinsRegular.copyWith(
                                color: ColorConstant.black,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 8, left: 8, top: 16),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      data?.title ?? '',
                      style: TextStyleConstant.poppinsRegular
                          .copyWith(fontSize: 23, fontWeight: FontWeight.bold),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8, right: 8, left: 8),
                child: Row(
                  children: [
                    const Icon(
                      Icons.food_bank_outlined,
                      size: 21,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      '${data?.servings} Serving',
                      style: TextStyleConstant.poppinsRegular
                          .copyWith(fontWeight: FontWeight.w100, fontSize: 16),
                      overflow: TextOverflow.visible,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Close'),
                              )
                            ],
                            title: Text(
                              'Nutrition Information',
                              style: TextStyleConstant.poppinsRegular
                                  .copyWith(fontSize: 16),
                            ),
                            content: const NutritionContentWidget(),
                          ),
                        );
                      },
                      child: Text(
                        'Nutrition Information',
                        style: TextStyleConstant.poppinsRegular.copyWith(
                            fontSize: 19,
                            color: ColorConstant.orangeColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: IconButton(
                        onPressed: () {
                          const snackBar = SnackBar(
                            content:
                                Text('The Content is still under development'),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        icon: const Icon(
                          Icons.favorite_border,
                          size: 25,
                        )),
                  )
                ],
              ),
              Divider(
                color: ColorConstant.orangeColor,
              ),
              Text(
                'Equipment',
                style: TextStyleConstant.poppinsRegular
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              const EquipmentWidget(),
              Container(
                margin: const EdgeInsets.only(right: 8, left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonCategoryWidget(
                        onTap: () {
                          provider.setDescription();
                        },
                        width: 120,
                        height: 45,
                        text: 'Descirption',
                        color: provider.isDescription
                            ? ColorConstant.orangeColor
                            : null,
                        textStyle: provider.isDescription
                            ? TextStyleConstant.poppinsRegular.copyWith(
                                fontWeight: FontWeight.bold,
                                color: ColorConstant.whitishGray)
                            : TextStyleConstant.poppinsRegular.copyWith(
                                fontWeight: FontWeight.bold,
                                color: ColorConstant.orangeColor)),
                    ButtonCategoryWidget(
                        onTap: () {
                          provider.setInstruction();
                        },
                        width: 120,
                        height: 45,
                        text: 'Instruction',
                        color: provider.isInstruction
                            ? ColorConstant.orangeColor
                            : null,
                        textStyle: provider.isInstruction
                            ? TextStyleConstant.poppinsRegular.copyWith(
                                fontWeight: FontWeight.bold,
                                color: ColorConstant.whitishGray)
                            : TextStyleConstant.poppinsRegular.copyWith(
                                fontWeight: FontWeight.bold,
                                color: ColorConstant.orangeColor)),
                    ButtonCategoryWidget(
                        onTap: () {
                          provider.setIngredients();
                        },
                        width: 120,
                        height: 45,
                        text: 'Ingredients',
                        color: provider.isIngredients
                            ? ColorConstant.orangeColor
                            : null,
                        textStyle: provider.isIngredients
                            ? TextStyleConstant.poppinsRegular.copyWith(
                                fontWeight: FontWeight.bold,
                                color: ColorConstant.whitishGray)
                            : TextStyleConstant.poppinsRegular.copyWith(
                                fontWeight: FontWeight.bold,
                                color: ColorConstant.orangeColor)),
                  ],
                ),
              ),
              SizedBox(
                  height: 500, child: _buildDetailRecipe(provider.selectType)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRecipe(DetailRecipeType selectDetail) {
    switch (selectDetail) {
      case DetailRecipeType.description:
        return const DescriptionRecipe();

      case DetailRecipeType.instruction:
        return const InstructionRecipe();

      case DetailRecipeType.ingredients:
        return const IngredientListView();
    }
  }
}
