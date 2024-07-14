import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:route_task/models/products_model/product_model.dart';

class ProductItem extends StatelessWidget {
  ProductItem({super.key,required this.product});
  Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        // color: Colors.grey[200],
          borderRadius:
          const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
              width: 1, color: Colors.blue)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Image(
                image: NetworkImage(
                    product.images![0]),
                width: double.infinity,
                height: 170,
              ),
              IconButton(onPressed: () {},
                icon: Icon(IconBroken.Heart,color: Colors.blue,),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                  elevation: WidgetStatePropertyAll(2),
                  shadowColor: WidgetStatePropertyAll(Colors.grey),
                ),)
            ],
          ),
          Text(
            product.title!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: [
              Text(
                "${product.price!} EGP",
                style: const TextStyle(
                    color: Colors.blue, fontSize: 12),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "${(product.price! - (product.discountPercentage! / (product.discountPercentage! + 100))).toStringAsFixed(2)} EGP",
                style: const TextStyle(
                    decoration:
                    TextDecoration.lineThrough,
                    fontSize: 10),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Review (${product.rating})",
                style: const TextStyle(
                    color: Colors.black, fontSize: 12),
              ),
              const SizedBox(
                width: 5,
              ),
              Icon(Icons.star,color: Colors.yellow,size: 20,),
              Spacer(),
              IconButton(onPressed: () {

              }, icon: Icon(Icons.add,color: Colors.white,), style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue),
              ),)
            ],
          ),
        ],
      ),
    );
  }
}
