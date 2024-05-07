import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_comfort_food/page/home_page/home_page_view_model.dart';
import 'package:your_comfort_food/page/home_page/home_category/home_page_grid_view_widget.dart.dart';
import 'package:your_comfort_food/widgets/loading_widget.dart';

class RecipeDairyFreeGridView extends StatelessWidget {
  const RecipeDairyFreeGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomePageViewModel>(context);
    if (provider.isLoadingDairyFreeRecipe) {
      return const LoadingWIdget(width: 50);
    } else if (provider.errorDairyFreeRecipe != null) {
      return Center(
        child: Text(provider.errorDairyFreeRecipe!),
      );
    } else {
      return HomePageGridViewWidget(
        onRefresh: () {
          provider.getDairyFreeRecipe();
        },
        dataApi: provider.dairyFreeRecipeResponse,
        dataLength: provider.dairyFreeRecipeResponse.recipes?.length,
        error: provider.errorDairyFreeRecipe,
      );
    }
  }
}
