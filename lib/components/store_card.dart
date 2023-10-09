import 'package:flutter/material.dart';

class NearStore extends StatefulWidget {
  final String storePathImage;
  final String storename;
  final String storeLocation;
  final String storeOpenTime;
  const NearStore({
    super.key,
    required this.storePathImage,
    required this.storename,
    required this.storeLocation,
    required this.storeOpenTime,
  });

  @override
  State<NearStore> createState() => _NearStoreState();
}

class _NearStoreState extends State<NearStore> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.green.shade100, width: 2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                  child: ClipRRect(
                    child: Image.asset(
                      widget.storePathImage,
                      width: 40,
                      height: 50,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.storename,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    widget.storeLocation,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    widget.storeOpenTime,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.3),
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
