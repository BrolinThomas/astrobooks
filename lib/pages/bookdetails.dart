import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/book_model.dart';
import '../models/cart_model.dart';

class BookDetailsPage extends StatelessWidget {
  final Book book;

  const BookDetailsPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Image-------------------------------------------------------------
            Center(
              child: Hero(
                tag: 'bookimage',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    book.imageUrl,
                    height: 300,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            //Details-----------------------------------------------------------
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Name: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                        ),
                        TextSpan(
                          text: book.name,
                          style: TextStyle(
                              fontSize: 18,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Author: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                        ),
                        TextSpan(
                          text: book.author,
                          style: TextStyle(
                              fontSize: 18,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Rating: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.star, color: Colors.amber),
                      Text(
                        ' ${book.rating}',
                        style: TextStyle(
                            fontSize: 18,
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Price: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                        ),
                        TextSpan(
                          text: '₹ ${book.price}/-',
                          style: TextStyle(
                              fontSize: 18,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Description: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                        ),
                        TextSpan(
                          text: book.description,
                          style: TextStyle(
                              fontSize: 18,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      //Add to cart button------------------------------------------------------
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.tertiary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add_shopping_cart),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Add to Cart',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
          onPressed: () {
            final cart = Provider.of<Cart>(context, listen: false);
            if(cart.isItemInCart(book)){showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialog(
                  title: Center(child: Text('!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 36),)),
                  content: Text('This book is already in your cart.',textAlign: TextAlign.center,),
                );
              },
            );
            }else {
              cart.addItemToCart(book);
              showDialog(
                context: context,
               builder: (context) =>
               const AlertDialog(
                title: Center(child: Text('Successfully added!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)),
                content: Text('Check your Cart.',textAlign: TextAlign.center,),
              ),
              );
            }
          },
        ),
      ),
    );
  }
}
