import 'package:flutter/material.dart';

class ProductDetailsAppbar extends StatefulWidget {
  final int index;
  final String fruitPath;
  const ProductDetailsAppbar(
      {super.key, required this.index, required this.fruitPath});

  @override
  State<ProductDetailsAppbar> createState() => _ProductDetailsAppbarState();
}

class _ProductDetailsAppbarState extends State<ProductDetailsAppbar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.4,
      child: SafeArea(
        child: Stack(children: [
          Column(
            children: [
              Container(
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.amber.shade200,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 40,
                              width: 45,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(15)),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios_new_outlined,
                                    color: Colors.white,
                                  )),
                            ),
                            const Text(
                              'Product Details',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Stack(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.shopping_cart,
                                      color: Color.fromARGB(255, 35, 94, 37),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
          Positioned(
              bottom: 5,
              right: 50,
              left: 45,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(150)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 255, 181, 207)
                              .withOpacity(0.05),
                          offset: const Offset(0, 1),
                          spreadRadius: 0,
                          blurRadius: 1,
                        )
                      ]),
                  child: Image.asset(
                    widget.fruitPath,
                    height: 220,
                    width: 150,
                  )))
        ]),
      ),
    );
  }
}
