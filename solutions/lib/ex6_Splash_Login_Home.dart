import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final  GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, State){
        return const SplahScreen();
      },
    ),
    GoRoute(
      path: '/login',
      builder:(context, state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path:'/home',
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
  ],
);
class Ex6SplashLoginHome extends StatelessWidget {
  const Ex6SplashLoginHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Exercise 6 - Splash, Login, Home Flow',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
class SplahScreen extends StatefulWidget {
  const SplahScreen({super.key});

  @override
  State<SplahScreen> createState() => _SplahScreenState();
}
// splash
class _SplahScreenState extends State<SplahScreen> {
  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 2),(){
      if (mounted){
        context.go('/login');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.flutter_dash, size: 80, color: Colors.blue),
            SizedBox(height: 24),
            Text(
              'Loading...',
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
// login
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: (){
            context.go('/hone');
          },
          icon: const Icon(Icons.login),
          label: const Text('Log In'),
        ),
      ),
    );
  }
}
//Home
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome Home!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: (){
                context.push('/login');
              }, 
              icon: const Icon(Icons.login),
              label: const Text('Push Login (demo)'),
            ),
          ],
        ),
      ),
    );
  }
}