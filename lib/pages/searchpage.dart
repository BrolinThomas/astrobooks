import 'dart:convert';

import 'package:astrobooks/pages/bookdetails.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../components/book_tile.dart';
import '../models/book_model.dart';
import '../models/cart_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Books'),
      ),
      resizeToAvoidBottomInset: false,
      //search bar--------------------------------------------------------------
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search books by name...',
                prefixIcon: const Hero(tag: 'search',
                child: Icon(Icons.search)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: _searchQuery.isEmpty
                ? const Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Opacity(opacity: 0.25,
                    child: Icon(Icons.search,size: 77,)),
                     SizedBox(height: 10,),
                    Text('What are you searching for?'),
                  ],
                ))
                : Consumer<Cart>(
              builder: (context, cart, child) {
                List<Book> filteredBooks = cart.getBookList().where((book) =>
                    book.name.toLowerCase().contains(_searchQuery.toLowerCase())).toList();

                return filteredBooks.isEmpty
                    ? Center(child: Text('No books found'))
                    : ListView.builder(
                  itemCount: filteredBooks.length,
                  itemBuilder: (context, index) {
                    Book book = filteredBooks[index];
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          book.imageUrl,
                          width: 50,
                          height: 75,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(book.name),
                      subtitle: Text('₹${book.price}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookDetailsPage(book: book),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}