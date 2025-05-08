class ProductModel {
final String image;
final String name;
final String description;
final double price;

ProductModel({
  required this.image,
  required this.name,
  required this.description,
  required this.price,
});



  static List<ProductModel> products = [
  
  ProductModel(
    image: 'assets/product/product1.png',
    name: 'October',
    description: 'Description of Product 1',
    price: 100,
  ),
  ProductModel(
    image: 'assets/product/product6.png',
    name: 'Octoper',
    description: 'Description of Product 2',
    price: 200,
  ),
  ProductModel(
    image: 'assets/product/product7.png',
    name: 'October',
    description: 'Description of Product 3',
    price: 150,
  ),
  ProductModel(
    image: 'assets/product/product8.png',
    name: 'October',
    description: 'Description of Product 4',
    price: 80,
  ),
  ProductModel(
    image: 'assets/product/product5.png',
    name: 'October',
    description: 'Description of Product 5',
    price: 120,
  ),
  ProductModel(
    image: 'assets/product/product9.png',
    name: 'October',
    description: 'Description of Product 6',
    price: 1000,
  ),
];
}