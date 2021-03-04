import 'package:flutter/material.dart';

class ScaffoldDesktop extends StatelessWidget {
  const ScaffoldDesktop({Key key, @required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ds = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: ds.width,
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    TextButton(onPressed: () {}, child: Text('MEN')),
                    SizedBox(width: 16),
                    TextButton(onPressed: () {}, child: Text('WOMEN')),
                    SizedBox(width: 16),
                    TextButton(onPressed: () {}, child: Text('KIDS')),
                    SizedBox(width: 16),
                    TextButton(onPressed: () {}, child: Text('HOME & LIVING')),
                    SizedBox(width: 16),
                    TextButton(onPressed: () {}, child: Text('OFFERS')),
                  ],
                ),
                Row(
                  children: [
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
                ),
              ],
            ),
          ),
          child,
        ],
      ),
    );
  }
}
