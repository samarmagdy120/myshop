import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myshop/shared/styles/icon_broken.dart';

class ProductScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: productBuilder()


    );
  }
Widget productBuilder () => Column(
  children: [
    buildGridProduct(),
  ],
);
/**************first carousel*********/
  Widget carouselItem () => CarouselSlider(
    options: CarouselOptions(height: 400.0),
    items: [1,2,3,4,5].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
             decoration: BoxDecoration(
               image: DecorationImage(
                 image: NetworkImage("https://student.valuxapps.com/storage/uploads/banners/1619472351ITAM5.3bb51c97376281.5ec3ca8c1e8c5.jpg")
               )
             ),
          );
        },
      );
    }).toList(),
  );

 /**************second carousel*************/

/******* grid product**********/

Widget buildGridProduct () =>
    Expanded(
      child: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(2, (index) {
          return buildGridProductItem();
        }),
      ),
    );

  /******* grid product item**********/

  Widget buildGridProductItem () =>Column(
    children: [
      Stack(
        children: [
          Image(image: NetworkImage("https://student.valuxapps.com/storage/uploads/banners/1619472351ITAM5.3bb51c97376281.5ec3ca8c1e8c5.jpg")),
          Text("offer")
        ],
      ),
      Expanded(
        child: Row(
          children: [
            Text("fffffff"),
            Spacer(),
            IconButton(
              onPressed: () {
                // print(model.id);
              },
              icon: CircleAvatar(
                  radius: 14.0,

                  child: Icon(
                    Icons.favorite_border,
                    color:Colors.white,
                    size: 14.0,
                  )
              ),
            )
          ],
        ),
      )
    ],
  );

}
