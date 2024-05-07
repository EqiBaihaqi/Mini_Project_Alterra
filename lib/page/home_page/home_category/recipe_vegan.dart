import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_comfort_food/page/home_page/home_page_view_model.dart';
import 'package:your_comfort_food/page/home_page/home_category/home_page_grid_view_widget.dart.dart';
import 'package:your_comfort_food/widgets/loading_widget.dart';

class RecipeVeganGridView extends StatelessWidget {
  const RecipeVeganGridView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomePageViewModel>(context);
    if (provider.isLoadingDairyFreeRecipe) {
      return const LoadingWIdget(width: 50);
    } else if (provider.errorVeganRecipe != null) {
      return Center(
        child: Text(provider.errorVeganRecipe!),
      );
    } else {
      return HomePageGridViewWidget(
        onRefresh: () {
          provider.getVeganRecipe();
        },
        dataApi: provider.veganRecipeResponse,
        dataLength: provider.veganRecipeResponse.recipes?.length,
        error: provider.errorVeganRecipe,
      );
    }
  }
}
