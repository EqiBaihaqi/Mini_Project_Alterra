import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:your_comfort_food/constant/color_constant.dart';
import 'package:your_comfort_food/constant/text_style_constant.dart';
import 'package:your_comfort_food/widgets/bottom_navigation_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        title: Text(
          'Find Your Best Recipe !',
          style: TextStyleConstant.poppinsRegular
              .copyWith(fontWeight: FontWeight.bold, fontSize: 23),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // number of items in each row
            mainAxisSpacing: 14.0, // spacing between rows
            crossAxisSpacing: 14.0, // spacing between columns
          ),
          padding: const EdgeInsets.all(8.0), // padding around the grid
          itemCount: 8, // total number of items
          itemBuilder: (context, index) {
            return Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.4  ), BlendMode.darken),
                      image: const NetworkImage(
                        'https://img.spoonacular.com/recipes/645704-556x370.jpg',
                      ),
                      fit: BoxFit.cover)),
              child: Container(
                margin: const EdgeInsets.only(
                    left: 10, bottom: 10, right: 10, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.timer_sharp,
                          color: ColorConstant.white,
                          size: 17,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          '20 Min',
                          style: TextStyleConstant.poppinsRegular
                              .copyWith(color: ColorConstant.white),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nasi Goreng Bojonegoro merah putih',
                          style: TextStyleConstant.poppinsRegular.copyWith(
                              color: ColorConstant.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.food_bank_outlined,
                              color: ColorConstant.white,
                              size: 17,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              '2 Serving',
                              style: TextStyleConstant.poppinsRegular.copyWith(
                                  color: ColorConstant.white,
                                  fontWeight: FontWeight.w100,
                                  fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
