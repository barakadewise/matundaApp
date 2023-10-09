import 'package:flutter/material.dart';

class MycartCard extends StatefulWidget {
  final String fruitPath;
  final String fruitname;
  final String priceTex;

  const MycartCard(
      {super.key,
      required this.fruitPath,
      required this.fruitname,
      required this.priceTex});

  @override
  State<MycartCard> createState() => _MycartCardState();
}

class _MycartCardState extends State<MycartCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                color: Colors.pink.shade100,
                borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Image.asset(
                widget.fruitPath,
                height: 60,
                width: 60,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              '1 x',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.fruitname,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Text(
                    widget.priceTex,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {},
              child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(15)),
                  child: Icon(
                    Icons.delete,
                    color: Colors.grey.shade600,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
