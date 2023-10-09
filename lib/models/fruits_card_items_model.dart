class FruitCardItems {
  final String imagePath;
  final String fruitname;
  final String price;

  FruitCardItems({
    required this.imagePath,
    required this.fruitname,
    required this.price,
  });
}

List<FruitCardItems> fruitCardItems = [
  FruitCardItems(
      imagePath: 'assets/images/mango.png', fruitname: 'mango', price: '1000'),
  FruitCardItems(
      imagePath: 'assets/images/orange.png',
      fruitname: 'orange',
      price: '1500'),
  FruitCardItems(
      imagePath: 'assets/images/pineapple.png',
      fruitname: 'pineapple',
      price: '1000'),
  FruitCardItems(
      imagePath: 'assets/images/strawberries.png',
      fruitname: 'strawberries',
      price: '2000'),
  FruitCardItems(
      imagePath: 'assets/images/green_apple.png',
      fruitname: 'apple',
      price: '1500')
];



