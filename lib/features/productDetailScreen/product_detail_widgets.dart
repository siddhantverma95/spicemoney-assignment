import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spicemoney_ecom_assignment/models/product.dart';

//Desktop Widgets
class ProductDetailsScrollViewDesktop extends StatelessWidget {
  const ProductDetailsScrollViewDesktop({Key key, @required this.obj})
      : super(key: key);
  final Datum obj;

  @override
  Widget build(BuildContext context) {
    final ds = MediaQuery.of(context).size;
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.grey.shade200,
          child: Row(
            children: [
              SizedBox(
                width: ds.width / 2,
                child: Hero(
                  tag: obj.imageUrl.hashCode,
                  child: CachedNetworkImage(
                    imageUrl: obj.imageUrl,
                    fit: BoxFit.cover,
                    imageBuilder: (context, imageProvider) => AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(image: imageProvider)),
                      ),
                    ),
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, error, something) => AspectRatio(
                      aspectRatio: 2,
                      child: Image.asset('lib/resources/images/error.gif'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: ds.width / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.fromLTRB(4, 8, 4, 4),
                      child: Container(
                        width: ds.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                              child: RichText(
                                maxLines: 3,
                                text: TextSpan(
                                  text: '${obj.name} ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                  children: [
                                    TextSpan(
                                      text:
                                          '${obj.longDesc.details.elementAt(0).productDetails} ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    TextSpan(
                                      text:
                                          '${obj.longDesc.details.elementAt(1).sizeFit} ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    TextSpan(
                                      text:
                                          '${obj.longDesc.details.elementAt(2).materialCare} ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                            //   child: Text(
                            //     '${obj.shortDesc}',
                            //     overflow: TextOverflow.ellipsis,
                            //     style: TextStyle(fontSize: 12, color: Colors.grey),
                            //   ),
                            // ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(8.0, 24.0, 8.0, 0.0),
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                    text: 'Rs.${obj.discountPrice}  ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                    children: [
                                      TextSpan(
                                          text: 'Rs.${obj.origPrice}',
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: 16,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w400)),
                                      TextSpan(
                                          text:
                                              '  (${obj.discountPercentage} OFF)',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.orange)),
                                    ]),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 4.0, left: 8.0, bottom: 8.0),
                                child: Text('inclusive of all taxes',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.teal,
                                        fontWeight: FontWeight.w600)))
                          ],
                        ),
                      ),
                    ),
                    obj.longDesc?.discountDetails != null
                        ? Card(
                            child: Container(
                              width: ds.width,
                              padding: EdgeInsets.all(16.0),
                              child: Text(obj.longDesc.discountDetails,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.w400)),
                            ),
                          )
                        : Container(),
                    obj.longDesc?.exchangeDtls != null
                        ? Card(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Icon(
                                        Icons.refresh_rounded,
                                        size: 40,
                                        color: Colors.black,
                                      ),
                                      Text(
                                          RegExp(r'[0-9]{2}').stringMatch(
                                              obj.longDesc.exchangeDtls.trim()),
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500))
                                    ],
                                  ),
                                  SizedBox(width: 8),
                                  Flexible(
                                    child: Text(obj.longDesc.exchangeDtls,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                    Card(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(16, 16, 16, 4),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('SELECT SIZE'),
                                  Text(
                                    'SIZE CHART',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.pink.shade600),
                                  ),
                                ]),
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            child: Wrap(
                                direction: Axis.horizontal,
                                alignment: WrapAlignment.start,
                                children: obj.longDesc.sizeDetails
                                    .map((e) => e.keys.elementAt(0))
                                    .map((key) => Container(
                                          width: 45,
                                          height: 45,
                                          margin: EdgeInsets.only(right: 8),
                                          child: Text(
                                            key,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 1)),
                                        ))
                                    .toList()),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  OutlinedButton.icon(
                                    icon: Icon(Icons.favorite_border),
                                    onPressed: () {},
                                    label: Text('WHISHLIST'),
                                  ),
                                  OutlinedButton.icon(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.pink),
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                    ),
                                    icon: Icon(Icons.shopping_bag_outlined),
                                    onPressed: () {},
                                    label: Text('ADD TO CART'),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      child: Container(
                        width: ds.width,
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Product Details",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "${obj.longDesc.details.elementAt(0).productDetails}",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Size & Fit",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "${obj.longDesc.details.elementAt(1).sizeFit}",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Material & Care",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "${obj.longDesc.details.elementAt(2).materialCare}",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Style Note",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "${obj.longDesc.details.elementAt(3).styleNote}",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Mobile Widgets
class ProductDetailsScrollViewMobile extends StatelessWidget {
  const ProductDetailsScrollViewMobile({Key key, @required this.obj})
      : super(key: key);
  final Datum obj;

  @override
  Widget build(BuildContext context) {
    final ds = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey.shade200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              margin: EdgeInsets.fromLTRB(4, 8, 4, 4),
              child: Container(
                width: ds.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                      child: RichText(
                        maxLines: 3,
                        text: TextSpan(
                          text: '${obj.name} ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                          children: [
                            TextSpan(
                              text:
                                  '${obj.longDesc.details.elementAt(0).productDetails} ',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            TextSpan(
                              text:
                                  '${obj.longDesc.details.elementAt(1).sizeFit} ',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            TextSpan(
                              text:
                                  '${obj.longDesc.details.elementAt(2).materialCare} ',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            // TextSpan(
                            //   text:
                            //       '${obj.longDesc.details.elementAt(3).styleNote}',
                            //   style: TextStyle(
                            //       color: Colors.grey,
                            //       fontSize: 14,
                            //       fontWeight: FontWeight.w400),
                            // ),
                          ],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                    //   child: Text(
                    //     '${obj.shortDesc}',
                    //     overflow: TextOverflow.ellipsis,
                    //     style: TextStyle(fontSize: 12, color: Colors.grey),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 24.0, 8.0, 0.0),
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                            text: 'Rs.${obj.discountPrice}  ',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                            children: [
                              TextSpan(
                                  text: 'Rs.${obj.origPrice}',
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400)),
                              TextSpan(
                                  text: '  (${obj.discountPercentage} OFF)',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.orange)),
                            ]),
                      ),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.only(top: 4.0, left: 8.0, bottom: 8.0),
                        child: Text('inclusive of all taxes',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.teal,
                                fontWeight: FontWeight.w600)))
                  ],
                ),
              ),
            ),
            obj.longDesc?.discountDetails != null
                ? Card(
                    child: Container(
                      width: ds.width,
                      padding: EdgeInsets.all(16.0),
                      child: Text(obj.longDesc.discountDetails,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w400)),
                    ),
                  )
                : Container(),
            obj.longDesc?.exchangeDtls != null
                ? Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(
                                Icons.refresh_rounded,
                                size: 40,
                                color: Colors.black,
                              ),
                              Text(
                                  RegExp(r'[0-9]{2}').stringMatch(
                                      obj.longDesc.exchangeDtls.trim()),
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                          SizedBox(width: 8),
                          Flexible(
                            child: Text(obj.longDesc.exchangeDtls,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
            Card(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 4),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('SELECT SIZE'),
                          Text(
                            'SIZE CHART',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.pink.shade600),
                          ),
                        ]),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.start,
                        children: obj.longDesc.sizeDetails
                            .map((e) => e.keys.elementAt(0))
                            .map((key) => Container(
                                  width: 45,
                                  height: 45,
                                  margin: EdgeInsets.only(right: 8),
                                  child: Text(
                                    key,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                          color: Colors.black, width: 1)),
                                ))
                            .toList()),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton.icon(
                            icon: Icon(Icons.favorite_border),
                            onPressed: () {},
                            label: Text('WHISHLIST'),
                          ),
                          OutlinedButton.icon(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.pink),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                            ),
                            icon: Icon(Icons.shopping_bag_outlined),
                            onPressed: () {},
                            label: Text('ADD TO CART'),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
            Card(
              child: Container(
                width: ds.width,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Product Details",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "${obj.longDesc.details.elementAt(0).productDetails}",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Size & Fit",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "${obj.longDesc.details.elementAt(1).sizeFit}",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Material & Care",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "${obj.longDesc.details.elementAt(2).materialCare}",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Style Note",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "${obj.longDesc.details.elementAt(3).styleNote}",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
