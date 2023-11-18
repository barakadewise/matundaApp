import 'package:flutter/material.dart';
import 'package:matunda/components/cart_appbar.dart';
import 'package:matunda/components/mycart_card.dart';
import 'package:matunda/models/fruits_card_items_model.dart';

class MycartPanel extends StatefulWidget {
  const MycartPanel({super.key});

  @override
  State<MycartPanel> createState() => _MycartPanelState();
}

class _MycartPanelState extends State<MycartPanel> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CartAppBar(),
              SizedBox(
                  height: size.height * 0.55,
                  child: ListView.builder(
                      itemCount: fruitCardItems.length,
                      itemBuilder: (context, index) {
                        return _buildCartListWidget(context, index);
                      })),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              const SizedBox(
                height: 30,
              ),
        
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
                    ),
                    Text(
                      'Tsh 10000',
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              
              //Payment button  here
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(20),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.green,
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 35, 94, 37),
                        borderRadius: BorderRadius.circular(20)),
                    height: 50,
                    child: const Center(
                      child: Text(
                        'Payment',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

//Cart build widget
  Widget _buildCartListWidget(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: MycartCard(
          fruitPath: fruitCardItems[index].imagePath,
          fruitname: fruitCardItems[index].fruitname,
          priceTex: fruitCardItems[index].price),
    );
  }
}
