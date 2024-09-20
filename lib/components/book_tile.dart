import 'package:flutter/material.dart';
import '../models/book_model.dart';
import '../pages/bookdetails.dart';

class BookTile extends StatelessWidget {
  final Book bookview;
  const BookTile({super.key, required this.bookview});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailsPage(book: bookview),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 200,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            //book details------------------------------------------------------
            Hero(
              tag: 'bookimage',
              child: ClipRRect(
                borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                child: SizedBox(
                  height: 310,
                  width: double.infinity,
                  child: Image.asset(
                    bookview.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              bookview.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 5),
            Text('₹ ${bookview.price}', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}