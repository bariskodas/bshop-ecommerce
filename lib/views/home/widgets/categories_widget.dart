import '../../../api/models/product_model.dart';
import '../../../riverpod/riverpods.dart';
import '../../../utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'product_card.dart';
import 'product_widget.dart';

class CategoriesWidget extends ConsumerStatefulWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CategoriesWidgetState();
}

class _CategoriesWidgetState extends ConsumerState<CategoriesWidget>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(
      length: ref.watch(getProductsRiverpod).getCategories()!.length,
      vsync: this);

  @override
  void initState() {
    int leng = ref.read(getProductsRiverpod).getCategories()!.length + 1;
    tabController = TabController(length: leng, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    var read = ref.read(getProductsRiverpod);
    var allProducts = read.products;
    List<String>? categoryList = read.getCategories();
    return Padding(
      padding: Constants.leftPadding24,
      child: Column(
        children: [
          //! Tabs
          SizedBox(
            height: 30,
            width: double.maxFinite,
            child: TabBar(
                labelColor: Colors.white,
                labelStyle: Theme.of(context).textTheme.titleMedium,
                unselectedLabelColor: Constants.darkGreyColor,
                indicator: BoxDecoration(
                    color: Constants.orangeColor,
                    borderRadius: BorderRadius.circular(24)),
                isScrollable: true,
                controller: tabController,
                tabs: [
                  //? Default tab
                  const Tab(text: "All"),
                  
                  // other tabs
                  for (var item in categoryList!)
                    Tab(
                        text: item[0].toUpperCase() +
                            item.substring(1).toLowerCase()),
                ]),
          ),
          const SizedBox(height: 10),

          //! Tab views
          Padding(
            padding: Constants.rightPadding24,
            child: SizedBox(
              height: _height * 0.7,
              width: double.maxFinite,
              child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: [
                    //? Default all products
                    ProductsWidget(viewChildren: [
                      for (var item in allProducts)
                        ProductCard(
                            title: item.title.toString(),
                            price: item.price.toString(),
                            image: item.image.toString(),
                            productDetails: item,
                            ),
                    ]),

                    //* sorted products
                    for (var item in categoryList)
                      ProductsWidget(
                          viewChildren: List.generate(
                              read.getSortedProducts(category: item)!.length,
                              (index){
                                List<ProductModel>? data = read.getSortedProducts(category: item);
                                return ProductCard(title: data![index].title.toString(), 
                                price: data[index].price.toString(), 
                                image: data[index].image.toString(),
                                productDetails: data[index],
                                );
                              })),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

class Exam extends ConsumerStatefulWidget {
  const Exam({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExamState();
}

class _ExamState extends ConsumerState<Exam> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Exammm extends StatefulWidget {
  const Exammm({Key? key}) : super(key: key);

  @override
  State<Exammm> createState() => _ExammmState();
}

class _ExammmState extends State<Exammm> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
