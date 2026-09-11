import 'package:flutter/material.dart';



class Exo4Newsscreentabs extends StatelessWidget {
  const Exo4Newsscreentabs({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NewsScreen(),
    );
  }
}

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,

      child: Scaffold(
        appBar: AppBar(
          title: const Text('News'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.sports_soccer),
                text: 'Sports',
              ),
              Tab(
                icon: Icon(Icons.computer),
                text: 'Technology',
              ),
              Tab(
                icon: Icon(Icons.business),
                text: 'Business',
              ),
            ],
          ),
        ),

        body: const TabBarView(
          children: [
            SportsPage(),
            TechnologyPage(),
            BusinessPage(),
          ],
        ),
      ),
    );
  }
}



class SportsPage extends StatelessWidget {
  const SportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Sports News',
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}



class TechnologyPage extends StatelessWidget {
  const TechnologyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Technology News',
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}



class BusinessPage extends StatelessWidget {
  const BusinessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Business News',
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}

