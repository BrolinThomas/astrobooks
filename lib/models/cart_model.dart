import 'package:flutter/material.dart';

import 'book_model.dart';

class Cart extends ChangeNotifier {
  //List of books---------------------------------------------------------------
  List<Book> bookCart = [
    Book(
      id: '1',
      name: 'Hindu Astrology',
      imageUrl: 'images/book2.jpg',
      price: 250,
      description: 'An authoritative classic on Hindu astrology, this book has been out of print for decades, and was originally published only in hardback. Now it will be published in paperback for the professional astrologer and for the general public alike',
      rating: 4.5,
      author: 'Dr Anthony P Stone ',
    ),
    Book(
      id: '2',
      name: 'The Signs',
      imageUrl: 'images/book1.jpg',
      price: 400,
      description: 'For thousands of years, people have looked to the night sky for guidance. Yet these days it’s so easy to lose touch with the universe and the important direction it can provide. In The Signs, astrologer and life coach Carolyne Faulkner reveals how the ancient wisdom of the stars can empower you to get the most out of life. Faulkner’s method is not about nebulous predictions or fate. It’s about discovering the qualities, good and bad, associated with your natal chart—the position of the planets at the time of your birth—and using that knowledge to inform your decisions and relationships. Easy to use and designed as both an introduction for the cosmically curious and a deep dive for experienced spiritual seekers, this guide shows you how to interpret your chart, find balance, and reconnect with yourself.',
      rating: 4.2,
      author: 'Carolyne Faulkner',
    ),
    Book(
      id: '3',
      name: 'Predictive Astrology',
      imageUrl: 'images/book3.png',
      price: 200,
      description: 'Predictive Astrology is a timeless masterpiece that every astrologer will want by their side as they deepen their astrological studies. The best way to learn is through practice, trial, and error, with a good teacher at the helm. Bernadette Brady is one of the best in the field. With this book by your side, you’re getting a master class in understanding what goes into predictive astrology - and perhaps this can help you, the reader, understand fate’s role in your life - and how to make it work for you.',
      rating: 4.7,
      author: 'Bernadette Brady',
    ),
    Book(
      id: '4',
      name: 'Vedic Astrology',
      imageUrl: 'images/book4.jpg',
      price: 170,
      description: "Have you ever wondered if the sky above, which holds a multitude of heavenly bodies, affects your life? Have you ever wondered why you are happy on certain days and sad on other days? Have you ever thought about why you work so hard, and yet your rewards don't match your efforts? Have you thought about astrology and wondered if it can answer some of your questions about life? If the answer to the above questions is yes, then you have come to the right place. This book on Vedic Astrology is the perfect place to find answers to the above questions and more.",
      rating: 4.3,
      author: 'Mari Silva',
    ),
  ];
  // Map to store books with quantities-----------------------------------------
  Map<String, MapEntry<Book, int>> userCart = {};

  // Get list of books for sale-------------------------------------------------
  List<Book> getBookList() {
    return bookCart;
  }

  // Get user cart--------------------------------------------------------------
  Map<String, MapEntry<Book, int>> getUserCart() {
    return userCart;
  }

  // Check if item in cart------------------------------------------------------
  bool isItemInCart(Book book) {
    return userCart.containsKey(book.id);
  }

  // Add item to cart-----------------------------------------------------------
  void addItemToCart(Book book) {
    if (isItemInCart(book)) {
      userCart[book.id] = MapEntry(book, userCart[book.id]!.value + 1);
    } else {
      userCart[book.id] = MapEntry(book, 1);
    }
    notifyListeners();
  }

  // Remove item from cart------------------------------------------------------
  void removeItemFromCart(Book book) {
    userCart.remove(book.id);
    notifyListeners();
  }

  // Increase quantity of an item in the cart-----------------------------------
  void increaseQuantity(Book book) {
    if (isItemInCart(book)) {
      userCart[book.id] = MapEntry(book, userCart[book.id]!.value + 1);
      notifyListeners();
    }
  }

  // Decrease quantity of an item in the cart-----------------------------------
  void decreaseQuantity(Book book) {
    if (isItemInCart(book) && userCart[book.id]!.value > 1) {
      userCart[book.id] = MapEntry(book, userCart[book.id]!.value - 1);
      notifyListeners();
    }
  }

  // Calculate total price------------------------------------------------------
  int getTotalPrice() {
    return userCart.values.fold(0, (sum, item) => sum + (item.key.price * item.value));
  }
}