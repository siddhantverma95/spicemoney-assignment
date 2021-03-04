import 'package:flutter/material.dart';
import 'package:spicemoney_ecom_assignment/core/responsive/app_responsive_layout.dart';
import 'package:spicemoney_ecom_assignment/features/appBar/app_bar_desktop.dart';
import 'package:spicemoney_ecom_assignment/features/appBar/app_bar_mobile.dart';
import 'package:spicemoney_ecom_assignment/features/productDetailScreen/product_detail_widgets.dart';
import 'package:spicemoney_ecom_assignment/models/product.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({Key key, this.obj}) : super(key: key);
  final Datum obj;
  @override
  _ProductDetailViewState createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  Widget build(BuildContext context) {
    return AppResponsiveLayout(
        desktop: ScaffoldDesktop(
          child: ProductDetailsScrollViewDesktop(
            obj: widget.obj,
          ),
        ),
        mobile: ScaffoldMobile(
          obj: widget.obj,
          child: ProductDetailsScrollViewMobile(
            obj: widget.obj,
          ),
        ));
  }
}
