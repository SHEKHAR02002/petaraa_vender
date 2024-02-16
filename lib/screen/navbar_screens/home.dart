import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petaraa_vender/constant/color.dart';
import 'package:petaraa_vender/widget/cards/displaycard_home.dart';
import 'package:petaraa_vender/widget/cards/reviewcard_home.dart';



class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "petaraa",
              style: TextStyle(
                  color: primary4Color,
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Autour"),
            ),
            Text(
              "SHOP",
              style: TextStyle(
                  color: primary4Color,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Autour"),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SvgPicture.asset(
              "assets/icons/bell.svg",
              colorFilter: ColorFilter.mode(primary4Color, BlendMode.srcIn),
            ),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 249, 235, 255),
      ),
      body: SingleChildScrollView(
        // padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: const Color.fromARGB(255, 249, 235, 255),
              child: Column(children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        color: Colors.grey.shade300,
                      ),
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        "assets/icons/management.svg",
                        width: 30,
                        height: 30,
                        colorFilter:
                            ColorFilter.mode(primaryColor, BlendMode.srcIn),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "TEST",
                          style: TextStyle(
                              fontSize: 18,
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Autour"),
                        ),
                        Text(
                          "test@gmail.com",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Overpass"),
                        ),
                      ],
                    )
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DisplayCard(
                        count: 28,
                        imagePath: 'assets/icons/productionInIcon.svg',
                        name: 'PRODUCT IN'),
                    DisplayCard(
                        count: 16,
                        imagePath: 'assets/icons/productionOutIcon.svg',
                        name: 'PRODUCT OUT')
                  ],
                )
              ]),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'Customer Reviews',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Autour',
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return const ReviewCard();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
