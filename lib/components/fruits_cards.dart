import 'package:flutter/material.dart';

class FruitCard extends StatefulWidget {
  final String fruitnameText;
  final String priceText;
  final String imagePath;
  final Color cardColor;

  const FruitCard(
      {super.key,
      required this.fruitnameText,
      required this.priceText,
      required this.imagePath,
      required this.cardColor});

  @override
  State<FruitCard> createState() => __FruitCardStateState();
}

class __FruitCardStateState extends State<FruitCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 250,
          width: 200,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0, 3),
                spreadRadius: 2,
                blurRadius: 4)
          ], color: widget.cardColor, borderRadius: BorderRadius.circular(25)),
          child: Column(
            children: [
              Image.asset(
                widget.imagePath,
                width: 150,
                height: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.fruitnameText,
                          style: TextStyle(
                              color: Colors.amber[800],
                              fontWeight: FontWeight.w700,
                              fontSize: 17),
                        ),
                        Text(widget.priceText,
                            style: TextStyle(
                                color: Colors.amber[800],
                                fontWeight: FontWeight.w700,
                                fontSize: 17)),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.amber[700],
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25))),
                    child: Center(
                      child: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.add)),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Positioned(
            right: 10,
            top: 10,
            child: Container(
              height: 35,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  )),
            )),
      ],
    );
  }
}
