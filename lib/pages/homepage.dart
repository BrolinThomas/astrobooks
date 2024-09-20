import 'package:astrobooks/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/book_tile.dart';
import '../components/my_drawer.dart';
import '../models/cart_model.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          drawer: MyDrawer(),
          appBar: AppBar(
            title: const Text('Explore'),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/searchpage');
                },
                icon: const Hero(tag: 'search',
                child: Icon(Icons.search)),
              )
            ],
          ),
          //floating button-----------------------------------------------------
          floatingActionButton: badges.Badge(
            position: badges.BadgePosition.topEnd(top: -6, end: 0),
            showBadge: cart.getUserCart().isNotEmpty,
            badgeContent: Text(
              cart.getUserCart().length.toString(),
              style: TextStyle(color: Colors.white),
            ),
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                Navigator.pushNamed(context, '/cartpage');
              },
              child: Icon(
                Icons.shopping_bag,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          //New Arrivals--------------------------------------------------------
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'New Arrivals',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'View all',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              //Book Tiles------------------------------------------------------
              SizedBox(
                height: 380,
                child: ListView.builder(
                  itemCount: cart.getBookList().length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Book bookview = cart.getBookList()[index];
                    return BookTile(
                      bookview: bookview,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}