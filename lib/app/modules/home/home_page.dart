import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:universe_store/app/modules/home/home_state.dart';
import 'package:universe_store/app/modules/home/home_store.dart';

import '../../components/product_item.dart';
import '../../values/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeStote _stote = HomeStote();
  @override
  void initState() {
    super.initState();
    _stote.gets();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<HomeStote, Exception, HomeState>(
      store: _stote,
      onState: (context, state) {
        return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(
              backgroundColor: AppColors.background,
              elevation: 0,
              title: Text(
                'Home',
                style: TextStyle(color: AppColors.primaryText),
              ),
            ),
            body: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(),
                      items: [1, 2].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                // decoration: BoxDecoration(color: Colors.amber),
                                child: Image.asset(
                                  "assets/images/slide$i.png",
                                  fit: BoxFit.cover,
                                ));
                          },
                        );
                      }).toList(),
                    ),
                    Container(
                      height: 72,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.categories.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 8),
                            decoration: BoxDecoration(
                                color: AppColors.minimize,
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              state.categories[index].name ?? "",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 400,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 3 / 4,
                                    crossAxisSpacing: 16,
                                    mainAxisSpacing: 16),
                            itemCount: state.products.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return ProductItem(
                                  product: state.products[index],
                                  onClick: () {
                                    Modular.to.pushNamed(
                                      "/detail",
                                      arguments: state.products[index],
                                    );
                                  });
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ));
      },
      onError: (context, error) => Center(child: Text(error.toString())),
      onLoading: (context) => const Center(child: CircularProgressIndicator()),
    );
  }
}
