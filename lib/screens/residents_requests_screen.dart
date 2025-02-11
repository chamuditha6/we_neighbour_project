import 'package:flutter/material.dart';
import '../components/app_bar.dart';
import '../constants/colors.dart';

class ResidentsRequestsScreen extends StatelessWidget {
  const ResidentsRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(onBackPressed: () => Navigator.pop(context)),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0),
              child: Text(
                'Residents\' Requests',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Add your residents' requests list here
          ],
        ),
      ),
    );
  }
}

