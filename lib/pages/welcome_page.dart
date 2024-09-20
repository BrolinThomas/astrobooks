import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo--------------------------------------------------------------
            Padding(
              padding: const EdgeInsets.only(top: 90, bottom: 10),
              child: Lottie.asset('images/astrocircle.json',repeat: true)
            ),

            const SizedBox(height: 20),

            //title-------------------------------------------------------------
            const Text(
              'A S T R O B O O K S',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),

            //sub title---------------------------------------------------------
            Padding(
              padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: Text(
                'Curated list of books that guide you to seek and understand your Destiny!',
                style: TextStyle(fontSize: 14,color: Theme.of(context).colorScheme.primary),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 50),


            //start now button--------------------------------------------------
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/homepage');
              },
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(25),
                  child: const Center(
                    child: Text(
                      'Shop Now',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
