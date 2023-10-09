import 'package:flutter/material.dart';
import 'package:matunda/components/product_detail.dart';
import 'package:matunda/models/fruits_card_items_model.dart';
import 'package:matunda/screens/cart_screen.dart';

class FruitDetails extends StatefulWidget {
  final int index;
  const FruitDetails({super.key, required this.index});

  @override
  State<FruitDetails> createState() => _FruitDetailsState();
}

class _FruitDetailsState extends State<FruitDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductDetailsAppbar(
                index: widget.index,
                fruitPath: fruitCardItems[widget.index].imagePath),
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Juicy Orange',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 18),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Sweety and juicy',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(color: Colors.red, width: 2)),
                            child: const Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                            )),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          'The orange is a round, vibrant fruit known for its sweet, tangy taste. '
                          'It\'s a popular choice for its juicy pulp, often eaten fresh or as refreshing '
                          'orange juice. Oranges are rich in vitamin C, supporting a healthy immune system, '
                          'and provide essential nutrients like fiber and potassium. Bitter oranges are used '
                          'fruit enjoyed worldwide.',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            
                              fontSize: 15,
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(15)),
                        child: const Icon(Icons.access_time),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Delivary Time',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '15 -20 min',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black.withOpacity(0.4)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tsh 1000',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17),
                      ),

                      //Inccrease And Decrease cart items buttons
                      Container(
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.green.shade100)),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.remove)),
                            const Text(
                              '01',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            IconButton(
                                onPressed: () {}, icon: const Icon(Icons.add))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                //Add cartButton
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 35, 94, 37)),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor:
                              const Color.fromARGB(255, 35, 94, 37),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const MycartPanel()));
                        },
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Add cart',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
