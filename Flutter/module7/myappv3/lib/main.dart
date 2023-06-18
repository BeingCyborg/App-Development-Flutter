import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [
    Product('Product 1', 10),
    Product('Product 2', 20),
    Product('Product 3', 30),
    Product('Product 4', 40),
    Product('Product 5', 50),
    Product('Product 6', 60),
    Product('Product 7', 70),
    Product('Product 8', 80),
    Product('Product 9', 90),
    Product('Product 10', 100),
  ];

  int totalProducts = 0;
  bool showCongratulations = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Product List'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(products[index].name),
              subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
              trailing: ProductCounter(
                product: products[index],
                onBuyNow: (product) {
                  setState(() {
                    product.incrementCounter();
                    totalProducts++;
                    if (product.counter == 5) {
                      showCongratulations = true;
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Congratulations!'),
                            content: Text('You\'ve bought 5 ${product.name}!'),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      ).then((value) {
                        setState(() {
                          showCongratulations = false;
                        });
                        if (totalProducts > 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CartPage(totalProducts),
                            ),
                          );
                        }
                      });
                    }
                  });
                },
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: showCongratulations
          ? BottomAppBar(
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Text(
                    'Cart',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            )
          : null,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage(totalProducts)),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class Product {
  final String name;
  final double price;
  int counter;

  Product(this.name, this.price) : counter = 0;

  void incrementCounter() {
    counter++;
  }
}

class ProductCounter extends StatelessWidget {
  final Product product;
  final Function(Product) onBuyNow;

  const ProductCounter(
      {super.key, required this.product, required this.onBuyNow});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('${product.counter}'),
        const SizedBox(width: 10),
        ElevatedButton(
          child: const Text('Buy Now'),
          onPressed: () {
            onBuyNow(product);
          },
        ),
      ],
    );
  }
}

class CartPage extends StatelessWidget {
  final int totalProducts;

  const CartPage(this.totalProducts, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Center(
        child: Text('Total Products: $totalProducts'),
      ),
    );
  }
}
