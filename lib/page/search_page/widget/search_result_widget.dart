import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_comfort_food/constant/color_constant.dart';
import 'package:your_comfort_food/constant/constant.dart';
import 'package:your_comfort_food/constant/text_style_constant.dart';
import 'package:your_comfort_food/page/search_page/search_page_view_model.dart';
import 'package:your_comfort_food/widgets/loading_widget.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchPageViewModel>(context);
    if (provider.isLoadingSearch) {
      return const Expanded(
        child: LoadingWIdget(
          width: 50,
        ),
      );
    } else if (provider.errorSearch != null) {
      return Center(
        child: Text(provider.errorSearch ?? ''),
      );
    } else {
      return Expanded(
          child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of items in each row
          mainAxisSpacing: 12.0, // spacing between rows
          crossAxisSpacing: 12.0, // spacing between columns
          childAspectRatio: 2 / 2,
        ),
        itemCount: provider.searchRecipesResponse.results?.length ?? 0,
        itemBuilder: (context, index) {
          var data = provider.searchRecipesResponse.results?[index];
          var dataIngredient =
              provider.searchIngredientResponse.results?[index];

          return Container(
            width: 315,
            height: 170,
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.4), BlendMode.darken),
                    image: NetworkImage(provider.isRecipe
                        ? data?.image ?? ''
                        : '$baseUrlImageIngredient${dataIngredient?.image}'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10)),
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        provider.isRecipe
                            ? data?.title ?? ''
                            : dataIngredient?.name ?? '',
                        style: TextStyleConstant.poppinsRegular.copyWith(
                            color: ColorConstant.whitishGray,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ));
    }
  }
}
