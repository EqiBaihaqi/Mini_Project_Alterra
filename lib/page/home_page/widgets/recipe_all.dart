import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:your_comfort_food/page/home_page/home_page_view_model.dart';

import 'package:your_comfort_food/page/home_page/widgets/home_page_grid_view_widget.dart.dart';
import 'package:your_comfort_food/widgets/loading_widget.dart';

class RecipeAllGridView extends StatefulWidget {
  const RecipeAllGridView({super.key});

  @override
  State<RecipeAllGridView> createState() => _RecipeAllGridViewState();
}

class _RecipeAllGridViewState extends State<RecipeAllGridView> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomePageViewModel>(context);

    if (provider.isLoadingRandomRecipe) {
      return const LoadingWIdget(width: 50);
    }
    if (provider.errorRandomRecipe != null) {
      return Center(
        child: Text(provider.errorRandomRecipe!),
      );
    } else {
      return HomePageGridViewWidget(
        dataApi: provider.randomRecipeResponse,
        dataLength: provider.randomRecipeResponse.recipes?.length,
        error: provider.errorRandomRecipe,
      );
    }
  }
}
