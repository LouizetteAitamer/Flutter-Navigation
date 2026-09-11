import 'package:flutter/material.dart';


class Ex3Shoppingapptabs extends StatelessWidget {
  const Ex3Shoppingapptabs({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ShoppingHome(),
    );
  }
}

class ShoppingHome extends StatefulWidget {
  const ShoppingHome({super.key});

  @override
  State<ShoppingHome> createState() => _ShoppingHomeState();
}

class _ShoppingHomeState extends State<ShoppingHome> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    FavoritesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),

        ],
      ),
    );
  }
}



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Home'),
      ),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: Text('Product ${index + 1}'),
          );
        },
      ),
    );
  }
}



class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: const Center(
        child: Text(
          'My Favorites',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}



class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Text(
          'My Profile',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}

