import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:matunda/components/custom_dashboard_appbar.dart';
import 'package:matunda/components/fruits_cards.dart';
import 'package:matunda/components/store_card.dart';
import 'package:matunda/graphqlservices/client.dart';
import 'package:matunda/models/fruits_card_items_model.dart';
import 'package:matunda/models/store_items_model.dart';
import 'package:matunda/screens/fruits_details.dart';

class Dashboard extends StatefulWidget {
  final String? userToken;
  const Dashboard({super.key,this.userToken});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
    final Client graPhqlClient = Client();
  final List<String> categoryList = ['Bestseller', 'Seasonal', 'Promotion'];
  final Map<String, Color> fruitcardColors = {
    'orange': Colors.orangeAccent.shade100,
    'mango': Colors.amber.shade100,
    'pineapple': Colors.amber.shade100,
    'strawberries': Colors.pink.shade100,
    'apple': Colors.green.shade100,
  };

  NearStoreModel nearStoreModel = NearStoreModel();

  //selected category list
  int selectedCategory = 0;
  int isSelecttredIcon = 0;
  bool isActiveIcon = true;

  //String query 

 String runQuery =r''' query fetchUsername($email:String!){
  user(email:$email){
    name
   
  }
}
''';

  Future<void> _getUsername() async {

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: GNav(
            haptic: true,
            hoverColor: Colors.red.shade100,
            duration: const Duration(milliseconds: 500),
            padding: const EdgeInsets.all(15),
            activeColor: isActiveIcon ? Colors.red : Colors.red.shade100,
            gap: 8,
            tabs: [
              GButton(
                icon: Icons.home,
                iconColor: Colors.red.shade100,
              ),
              GButton(
                icon: Icons.storefront_outlined,
                iconColor: Colors.red.shade100,
              ),
              GButton(
                  icon: Icons.shopping_cart, iconColor: Colors.red.shade100),
              GButton(
                icon: Icons.person,
                iconColor: Colors.red.shade100,
              )
            ]),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          // physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const DashbordAppbar(
                  profileImagePath: 'assets/images/profile.png',
                  usernameText: 'Baraka'),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'All Fruits',
                      style: TextStyle(
                          color: Color.fromARGB(255, 35, 94, 37),
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'View all',
                      style: TextStyle(
                          color: Colors.red[900], fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                child: SizedBox(
                    height: 45,
                    child: Center(
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: categoryList.length,
                          itemBuilder: (context, index) {
                            return _buildCategoryNavigator(context, index);
                          }),
                    )),
              ),
              SizedBox(
                height: 300,
                width: size.width,
                child: Center(
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: fruitCardItems.length,
                      itemBuilder: (context, index) {
                        return _buildFruitWiget(context, index);
                      }),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text('Nearby Store',
                        style: TextStyle(
                            color: Color.fromARGB(255, 35, 94, 37),
                            fontSize: 20,
                            fontWeight: FontWeight.w600))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 90,
                width: size.width,
                child: Center(
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: nearStoreModel.storeImagepath.length,
                      itemBuilder: (context, index) {
                        return _buildStoreWidget(context, index);
                      }),
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }

//Topcategory build widget
  Widget _buildCategoryNavigator(BuildContext context, index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Container(
          height: 40,
          width: 90,
          decoration: BoxDecoration(
              color: selectedCategory == index
                  ? const Color.fromARGB(255, 35, 94, 37).withOpacity(0.2)
                  : Colors.grey[100],
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              categoryList[index],
              style: TextStyle(
                  color: selectedCategory == index
                      ? const Color.fromARGB(255, 35, 94, 37)
                      : Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  //fruit build widget
  Widget _buildFruitWiget(BuildContext context, int index) {
    final fruitname = fruitCardItems[index].fruitname.toLowerCase();
    final fruitcardColor = fruitcardColors[fruitname] ?? Colors.amber[100];

    return InkWell(
      onTap: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => FruitDetails(index: index)))
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: FruitCard(
            fruitnameText: fruitCardItems[index].fruitname,
            priceText: fruitCardItems[index].price,
            imagePath: fruitCardItems[index].imagePath,
            cardColor: fruitcardColor!),
      ),
    );
  }

  //store building widget
  Widget _buildStoreWidget(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: NearStore(
        storePathImage: nearStoreModel.storeImagepath[index],
        storename: nearStoreModel.storeName[index],
        storeLocation: nearStoreModel.storeLocation[index],
        storeOpenTime: '8 am -10 pm',
      ),
    );
  }
}
