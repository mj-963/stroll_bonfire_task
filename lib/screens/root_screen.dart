import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stroll_bonfire_task/providers/bottom_nav_index.dart';
import 'package:stroll_bonfire_task/screens/bonfire_screen.dart';
import 'package:stroll_bonfire_task/screens/chat_screen.dart';
import 'package:stroll_bonfire_task/screens/home_screen.dart';
import 'package:stroll_bonfire_task/screens/profile_screen.dart';

class RootScreen extends ConsumerStatefulWidget {
  const RootScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<RootScreen> {
  final List<Widget> _pages = [
    const HomeScreen(),
    const BonfireScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[ref.watch(bottomNavIndexProvider)],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: ref.watch(bottomNavIndexProvider),
        onTap: (index) {
          ref.read(bottomNavIndexProvider.notifier).state = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/card.svg',
              colorFilter: ColorFilter.mode(
                ref.watch(bottomNavIndexProvider) == 0
                    ? Colors.white
                    : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/bonfire.svg',
              colorFilter: ColorFilter.mode(
                ref.watch(bottomNavIndexProvider) == 1
                    ? Colors.white
                    : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/chat.svg',
              colorFilter: ColorFilter.mode(
                ref.watch(bottomNavIndexProvider) == 2
                    ? Colors.white
                    : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/user.svg',
              colorFilter: ColorFilter.mode(
                ref.watch(bottomNavIndexProvider) == 3
                    ? Colors.white
                    : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
