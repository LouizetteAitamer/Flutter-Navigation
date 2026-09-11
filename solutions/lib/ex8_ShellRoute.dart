import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


final GoRouter router =GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return ScaffoldWithNavbar(
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) {
            return const HomePage();
          },
        ),
        GoRoute(
          path: '/favorites',
          builder: (context, state) {
            return const FavoritesPage();
          },
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) {
            return const ProfilePage();
          },
        ), 
      ],
    ),
  ],
  initialLocation: '/home'
);
class Ex8Shellroute extends StatelessWidget {
  const Ex8Shellroute({super.key});

  @override
 Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Exercise 8 - ShellRoute Conversion',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
class ScaffoldWithNavbar extends StatelessWidget {
  final Widget child;
  const ScaffoldWithNavbar({
    super.key,
    required this.child });
  int getCurrentIndex(BuildContext context){
    final loction =GoRouterState.of(context).uri.toString();
    if (loction.startsWith('/home')) return 0;
    if (loction.startsWith('/favorites')) return 1;
    if (loction.startsWith('/profile')) return 2;
    return 0; 
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = getCurrentIndex(context);
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          switch(index){
            case 0:
              context.go('/home');
            break;
            case 1: 
              context.go('/favorites');
            break;
            case 2: 
              context.go('/profile');
            break;
          }
        },
        items: const[
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

//Home
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text(
          'Home Page',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

//Favorites
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
          'Favorites Page',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}



//Profile
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
          'Profile Page',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}