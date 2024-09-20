import 'package:astrobooks/pages/cartpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            //Logo--------------------------------------------------------------
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Image.asset(
                  'images/logo.png',
                  color: Theme.of(context).colorScheme.primary,
                  scale: 5,
                )),
            const Text(
              'A S T R O B O O K S',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(
              height: 10,
            ),
            //Explore button----------------------------------------------------
            ListTile(
              title: Text(
                'Explore',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              leading: Icon(
                Icons.explore_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
              onTap: () {
                Navigator.pop(context);
              },
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            //Cart button-------------------------------------------------------
            ListTile(
              title: Text(
                'Cart',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              leading: Icon(
                Icons.shopping_cart_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/cartpage');
              },
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const Spacer(),
            Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
            //Dark mode---------------------------------------------------------
            ListTile(
              leading: Icon(
                Icons.dark_mode,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: const Text('Dark Mode'),
              trailing: CupertinoSwitch(
                onChanged: (value) =>
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme(),
                value: Provider.of<ThemeProvider>(context, listen: false)
                    .isDarkMode,
              ),
            ),
            //Exit--------------------------------------------------------------
            ListTile(
              title: Text(
                'Exit',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              leading: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.primary,
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/welcome');
              },
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      )),
    );
  }
}
