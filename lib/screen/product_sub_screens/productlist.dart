import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petaraa_vender/constant/color.dart';
import 'package:petaraa_vender/data/categorydata.dart';
import 'package:petaraa_vender/screen/product_sub_screens/addproductscreen.dart';
import 'package:petaraa_vender/widget/cards/productcard_product.dart';
import 'package:petaraa_vender/widget/miscellaneous/decoration.dart';

class ProductListScreen extends StatefulWidget {
  final CategoryData categorydata;
  const ProductListScreen({super.key, required this.categorydata});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categorydata.heading.toString(),
          style: TextStyle(
              fontFamily: 'Autour',
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: width / 1.8,
                  decoration: shadowdecoration,
                  child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Search',
                        suffixIcon: Icon(
                          CupertinoIcons.search,
                          color: primaryColor,
                        ),
                        hintStyle:
                            TextStyle(fontSize: 15, color: primaryColor)),
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: shadowdecoration,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 22),
                    child: Row(
                      children: [
                        Text(
                          "Filter",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: primaryColor),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SvgPicture.asset(
                          "assets/icons/filter.svg",
                          colorFilter:
                              ColorFilter.mode(primary4Color, BlendMode.srcIn),
                          height: 24,
                          width: 24,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const ProductCard()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AddProductScreen())),
        backgroundColor: primaryColor,
        child: SvgPicture.asset(
          "assets/icons/productadd.svg",
          height: 28,
          width: 28,
        ),
      ),
    );
  }
}
