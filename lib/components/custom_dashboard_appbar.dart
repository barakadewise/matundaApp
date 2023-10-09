import 'package:flutter/material.dart';

class DashbordAppbar extends StatefulWidget {
  final String profileImagePath;
  final String usernameText;
  const DashbordAppbar(
      {super.key, required this.profileImagePath, required this.usernameText});

  @override
  State<DashbordAppbar> createState() => _DashbordAppbarState();
}

class _DashbordAppbarState extends State<DashbordAppbar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.26,
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    child: Image.asset(
                      widget.profileImagePath,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        const Text(
                          'Hi',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Text(
                            widget.usernameText,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                children: [
                  Text(
                    'What would you like to buy?',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w300),
                    prefixIcon: Icon(Icons.search,
                        color: const Color.fromARGB(255, 35, 94, 37)
                            .withOpacity(0.5)),
                    labelText: 'Search your favourite fruits',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
