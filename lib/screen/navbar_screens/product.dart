import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petaraa_vender/constant/color.dart';
import 'package:petaraa_vender/data/categorydata.dart';
import 'package:petaraa_vender/screen/product_sub_screens/addcategorybottomsheet.dart';
import 'package:petaraa_vender/widget/cards/categorycard_product.dart';
import 'package:petaraa_vender/widget/miscellaneous/decoration.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Category",
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
                  width: width / 1.4,
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
                        hintStyle: const TextStyle(
                          fontSize: 15,
                          color: Color(
                            0xff8c8c8c,
                          ),
                        )),
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  "assets/icons/filter.svg",
                  colorFilter: ColorFilter.mode(primary4Color, BlendMode.srcIn),
                  height: 30,
                  width: 30,
                ),
              ],
            ),
            const SizedBox(height: 20),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CategoryCard(
                      categorydata: categorydata[index],
                    ),
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: () async {
          addcategorybottomsheet(
              context: context, categorydataList: categorydata);
        },
        label: const Text(
          'Add Category',
          style: TextStyle(color: Colors.white),
        ),
        icon: const Icon(CupertinoIcons.add, color: Colors.white),
        backgroundColor: primaryColor,
      ),
    );
  }
}
