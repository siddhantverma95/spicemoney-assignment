import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spicemoney_ecom_assignment/models/product.dart';

class ProductListDesktopWidget extends StatelessWidget {
  const ProductListDesktopWidget(
      {Key key, @required this.obj, @required this.callback})
      : super(key: key);
  final Datum obj;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        padding: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 6,
              child: Hero(
                tag: obj.imageUrl.hashCode,
                child: CachedNetworkImage(
                  imageUrl: obj.imageUrl,
                  fit: BoxFit.cover,
                  imageBuilder: (context, imageProvider) => AspectRatio(
                    aspectRatio: 2,
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
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${obj.name}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        Icon(Icons.favorite_border)
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                    child: Text(
                      '${obj.shortDesc}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                          text: 'Rs.${obj.discountPrice}  ',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                          children: [
                            TextSpan(
                                text: 'Rs.${obj.origPrice}',
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400)),
                            TextSpan(
                                text: '  (${obj.discountPercentage} OFF)',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.orange)),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
