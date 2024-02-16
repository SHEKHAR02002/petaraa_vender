import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petaraa_vender/api/authapi.dart';
import 'package:petaraa_vender/constant/color.dart';
import 'package:petaraa_vender/screen/navbar_screens/home.dart';
import 'package:petaraa_vender/screen/navbar_screens/manegment.dart';
import 'package:petaraa_vender/screen/navbar_screens/product.dart';
import 'package:petaraa_vender/screen/navbar_screens/profile.dart';

class NavigationBarScreen extends ConsumerStatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  ConsumerState<NavigationBarScreen> createState() =>
      _NavigationBarScreenState();
}

class _NavigationBarScreenState extends ConsumerState<NavigationBarScreen> {
  StateProvider currentPageProvider = StateProvider((ref) => 0);

  final screens = [
    const HomeScreen(),
    const ProductScreen(),
    const ManegmentScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    final currentPageIndex = ref.watch(currentPageProvider);
    Auth().getuserdetails(ref: ref);
    return Scaffold(
      body: screens[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          ref.watch(currentPageProvider.notifier).state = index;
        },
        indicatorColor: primaryColor,
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
              color: currentPageIndex == 0 ? white : CupertinoColors.systemGrey,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              'assets/icons/product.svg',
              colorFilter: ColorFilter.mode(
                  currentPageIndex == 1 ? white : CupertinoColors.systemGrey,
                  BlendMode.srcIn),
            ),
            label: '',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              'assets/icons/management.svg',
              colorFilter: ColorFilter.mode(
                  currentPageIndex == 2 ? white : CupertinoColors.systemGrey,
                  BlendMode.srcIn),
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person_outline_rounded,
              color: currentPageIndex == 3 ? white : CupertinoColors.systemGrey,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
