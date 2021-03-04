import 'package:flutter/material.dart';
import 'package:spicemoney_ecom_assignment/core/responsive/app_responsive_layout.dart';
import 'package:spicemoney_ecom_assignment/features/appBar/app_bar_desktop.dart';
import 'package:spicemoney_ecom_assignment/features/productDetailScreen/product_detail_view.dart';
import 'package:spicemoney_ecom_assignment/features/productList/product_list_view_model.dart';
import 'package:spicemoney_ecom_assignment/features/productList/product_list_widget.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ds = MediaQuery.of(context).size;
    return AppResponsiveLayout(
      mobile: Scaffold(
        appBar: AppBar(
          title: Text('Clothes'),
          centerTitle: false,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.shopping_bag_outlined),
              onPressed: () {},
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.sort_by_alpha_outlined),
                  label: Text('Sort')),
              SizedBox(
                height: 24,
                child: VerticalDivider(
                  thickness: 1,
                ),
              ),
              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.filter_alt_outlined),
                  label: Text('Filter'))
            ],
          ),
        ),
        drawer: Container(
          alignment: Alignment.center,
          width: ds.width / 2,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () {}, child: Text('MEN')),
              SizedBox(height: 24),
              TextButton(onPressed: () {}, child: Text('WOMEN')),
              SizedBox(height: 24),
              TextButton(onPressed: () {}, child: Text('KIDS')),
              SizedBox(height: 24),
              TextButton(onPressed: () {}, child: Text('HOME & LIVING')),
              SizedBox(height: 24),
              TextButton(onPressed: () {}, child: Text('OFFERS')),
            ],
          ),
        ),
        body: ProductsGridView(),
      ),
      desktop: ScaffoldDesktop(child: Expanded(child: ProductsGridView())),
    );
  }
}

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ds = MediaQuery.of(context).size;
    return WhenRebuilder<ProductListViewModel>(
      observe: () =>
          RM.get<ProductListViewModel>()..setState((s) => s.fetchProducts()),
      onData: (data) => GridView.builder(
          shrinkWrap: true,
          itemCount: data.getProducts.data.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: ds.width > 950
                ? .5
                : ds.width > 700
                    ? .7
                    : .5,
            maxCrossAxisExtent: ds.width > 950
                ? ds.width / 5
                : ds.width > 700
                    ? ds.width / 3
                    : ds.width / 2,
          ),
          itemBuilder: (context, index) => ProductListDesktopWidget(
              callback: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProductDetailView(
                          obj: data.getProducts.data.elementAt(index),
                        )));
              },
              obj: data.getProducts.data.elementAt(index))),
      onWaiting: () => Center(
        child: CircularProgressIndicator(),
      ),
      onIdle: () => Center(
        child: CircularProgressIndicator(),
      ),
      onError: (error) => Center(
        child: Text(error),
      ),
    );
  }
}
