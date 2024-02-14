import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petaraa_vender/constant/color.dart';
import 'package:petaraa_vender/data/categorydata.dart';
import 'package:petaraa_vender/screen/product_sub_screens/productlist.dart';
import 'package:petaraa_vender/widget/miscellaneous/decoration.dart';

class CategoryCard extends ConsumerWidget {
  final CategoryData categorydata;
  const CategoryCard({super.key, required this.categorydata});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductListScreen(
                        categorydata: categorydata,
                      ))),
          child: Container(
            decoration: shadowdecoration,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Row(
                children: [
                  Container(
                    height: 85,
                    width: 85,
                    color: primaryColor,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        categorydata.heading.toString(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Total product(s):  ${categorydata.prductcount.toString()}",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(
                            0xff878787,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Includes: Biscuits ,Bones ....",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(
                            0xff878787,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              "assets/icons/threedot.svg",
              colorFilter: ColorFilter.mode(primary4Color, BlendMode.srcIn),
              height: 20,
              width: 20,
            ),
          ),
        ),
      ],
    );
  }
}
