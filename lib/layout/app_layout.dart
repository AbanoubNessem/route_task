import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:route_task/components/product_item/product_item.dart';
import 'package:route_task/cubit/app_cubit/app_layout_cubit.dart';
import 'package:route_task/cubit/app_cubit/app_layout_state.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppLayoutCubit()..getHomeData(),
      child: BlocConsumer<AppLayoutCubit, AppLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Route",
                style: TextStyle(color: Colors.blue[700]),
              ),
            ),
            body: ConditionalBuilder(
              condition: AppLayoutCubit.get(context).products.product != null,
              builder: (context) => SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                    borderSide: BorderSide(color: Colors.blue)),
                                prefixIcon: Icon(
                                  IconBroken.Search,
                                  color: Colors.blue,
                                ),
                                hintText: "What do you search for ?"),
                          ),
                        )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shopping_cart_outlined,
                              size: 28,
                              color: Colors.blue,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 1 / 1.7,
                      children: List.generate(
                          AppLayoutCubit.get(context).products.product!.length,
                          (index) => ProductItem(
                              product: AppLayoutCubit.get(context)
                                  .products
                                  .product![index])),
                    )
                  ],
                ),
              ),
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
    );
  }
}
