import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/book_model.dart';
import '../models/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          //if cart is empty----------------------------------------------------
          if (cart.getUserCart().isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Opacity(opacity: 0.25,
                  child: Icon(Icons.shopping_cart_outlined,size: 77,)),
                  Text('Your cart is empty'),
                ],
              ),
            );
          }
          //cart items----------------------------------------------------------
          return ListView.builder(
            itemCount: cart.getUserCart().length,
            itemBuilder: (context, index) {
              String bookId = cart.getUserCart().keys.elementAt(index);
              Book book = cart.getUserCart()[bookId]!.key;
              int quantity = cart.getUserCart()[bookId]!.value;
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Image.asset(
                            book.imageUrl,
                            width: 50,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(book.name),
                          Text('₹${book.price}'),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(width: 0.5,color: Colors.black38),
                                borderRadius: BorderRadius.circular(30)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: quantity > 1
                                      ? () => cart.decreaseQuantity(book)
                                      : null,
                                ),
                                Text('$quantity'),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () => cart.increaseQuantity(book),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.cancel, color: Theme.of(context).colorScheme.primary),
                        onPressed: () => cart.removeItemFromCart(book),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      //Total price and checkout------------------------------------------------
      bottomNavigationBar: Consumer<Cart>(
        builder: (context, cart, child) {
          int totalPrice = cart.getTotalPrice();
          return Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: ₹$totalPrice',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                  ),
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(Icons.shopping_cart_checkout),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Checkout'),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
