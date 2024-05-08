import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_comfort_food/constant/color_constant.dart';

import 'package:your_comfort_food/constant/text_style_constant.dart';
import 'package:your_comfort_food/page/search_page/search_page_view_model.dart';
import 'package:your_comfort_food/page/search_page/widget/search_result_widget.dart';
import 'package:your_comfort_food/widgets/search_text_form_widget.dart';

class SearchPage extends StatefulWidget {
  final bool autoFocus;
  const SearchPage({super.key, required this.autoFocus});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchPageViewModel>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          toolbarHeight: 80,
          title: Text(
            'Search Recipe',
            style: TextStyleConstant.poppinsRegular
                .copyWith(fontWeight: FontWeight.bold, fontSize: 23),
          ),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SearchTextFormWidget(
                      autoFocus: widget.autoFocus,
                      width: 315,
                      height: 42,
                      controller: provider.queryController,
                      onSubmitted: (String value) {
                        provider.getSearchRecipe();
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 10),
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: ColorConstant.orangeColor),
                            borderRadius: BorderRadius.circular(12)),
                        child: IconButton(
                            onPressed: () {
                              provider.getSearchRecipe();
                            },
                            icon: Icon(
                              Icons.refresh_rounded,
                              color: ColorConstant.orangeColor,
                              size: 23,
                            )))
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'Result',
                    style: TextStyleConstant.poppinsRegular
                        .copyWith(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ),
                const SearchResultWidget()
              ],
            )));
  }
}
