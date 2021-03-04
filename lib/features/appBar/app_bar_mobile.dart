import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spicemoney_ecom_assignment/models/product.dart';

class ScaffoldMobile extends StatelessWidget {
  const ScaffoldMobile({Key key, @required this.child, @required this.obj})
      : super(key: key);
  final Widget child;
  final Datum obj;

  @override
  Widget build(BuildContext context) {
    final ds = MediaQuery.of(context).size;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isBool) {
          return [
            SliverAppBar(
              title: Text(obj.name),
              actions: [
                IconButton(
                  icon: Icon(Icons.share),
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
              pinned: true,
              backgroundColor: Colors.white,
              expandedHeight: ds.height / 3,
              centerTitle: false,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
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
            ),
          ];
        },
        body: child,
      ),
    );
  }
}
