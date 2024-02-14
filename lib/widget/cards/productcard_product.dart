import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petaraa_vender/constant/color.dart';
import 'package:petaraa_vender/widget/miscellaneous/decoration.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: shadowdecoration,
        child: Row(
          children: [
            Container(
              height: 85,
              width: 85,
              color: primaryColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Pedigree",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Stock Available",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(
                      0xff48be5b,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                RichText(
                  text: TextSpan(
                    text: "800",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: primaryColor),
                    children: const <TextSpan>[
                      TextSpan(
                          text: '\t\t\t 500',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(
                              0xff8c8c8c,
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            )
          ],
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
    ]);
  }
}
