import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stroll_bonfire_task/widgets/app_bar.dart';

class BonfireScreen extends ConsumerStatefulWidget {
  const BonfireScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BonfireScreenState();
}

class _BonfireScreenState extends ConsumerState<BonfireScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // Background image
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background_video.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Gradient Overlay
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black87],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Foreground Content
          const SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // custom app bar
                  CustomAppBar(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
