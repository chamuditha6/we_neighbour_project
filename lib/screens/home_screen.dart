import 'package:flutter/material.dart';
import '../widgets/header_widget.dart';
import '../widgets/feature_grid.dart';
import '../widgets/service_card.dart';
import '../widgets/bottom_navigation.dart';
import '../main.dart';

class HomeScreen extends StatefulWidget {
  final UserType userType;

  const HomeScreen({Key? key, required this.userType}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 3) { // Profile tab
      Navigator.pushNamed(
        context,
        '/profile',
        arguments: widget.userType,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderWidget(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FeatureGrid(),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      children: const [
                        ServiceCard(
                          title: 'High-quality painting services for a fresh new look',
                          image: 'assets/images/painting.jpg',
                          company: 'ABC Company',
                        ),
                        ServiceCard(
                          title: 'Expert plumbing services for all your needs',
                          image: 'assets/images/plumbing.jpg',
                          company: 'ABC Company',
                        ),
                        ServiceCard(
                          title: 'Professional carpentry work for repairs and improvements',
                          image: 'assets/images/carpentry.jpg',
                          company: 'ABC Company',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        userType: widget.userType,
      ),
    );
  }
}