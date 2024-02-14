import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petaraa_vender/constant/color.dart';
import 'package:petaraa_vender/screen/product_sub_screens/addvariantproduct.dart';
import 'package:petaraa_vender/widget/miscellaneous/decoration.dart';
import 'package:petaraa_vender/widget/popups/selectimagetype_popup.dart';

class AddProductScreen extends ConsumerStatefulWidget {
  const AddProductScreen({super.key});

  @override
  ConsumerState<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends ConsumerState<AddProductScreen> {
  StateProvider isSwitchedProvider = StateProvider((ref) => false);

  final TextEditingController _productname = TextEditingController(),
      _brandname = TextEditingController(),
      _subcategory = TextEditingController(),
      _productdiscription = TextEditingController(),
      _mainsize = TextEditingController(),
      _mainmrp = TextEditingController(),
      _mainprice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final isSwitched = ref.watch(isSwitchedProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Product",
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)),
                height: 140,
                width: 140,
                child: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: ((context) => selecteimagetype()));
                  },
                  icon: const Icon(
                    CupertinoIcons.add_circled,
                    size: 50,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Add Item Image",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(
                    0xff8c8c8c,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Item Name",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              decoration: shadowdecoration,
              child: TextField(
                style: const TextStyle(fontSize: 16),
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter Item Name',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      color: Color(
                        0xff8c8c8c,
                      ),
                    )),
                controller: _productname,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Brand name",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              decoration: shadowdecoration,
              child: TextField(
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter Brand Name',
                      hintStyle: const TextStyle(
                        fontSize: 15,
                        color: Color(
                          0xff8c8c8c,
                        ),
                      )),
                  controller: _brandname),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Size",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              decoration: shadowdecoration,
              child: TextField(
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'For eg: S, M, L, 1Kg, 2Kg',
                      hintStyle: const TextStyle(
                        fontSize: 15,
                        color: Color(
                          0xff8c8c8c,
                        ),
                      )),
                  controller: _mainsize),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "MRP",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              decoration: shadowdecoration,
              child: TextField(
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter MRP /Original Price',
                      hintStyle: const TextStyle(
                        fontSize: 15,
                        color: Color(
                          0xff8c8c8c,
                        ),
                      )),
                  controller: _mainmrp),
            ),
            const SizedBox(
              height: 30,
            ),
            RichText(
              text: const TextSpan(
                text: 'Discounted price',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: '\t\t\t*if applicable',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black)),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              decoration: shadowdecoration,
              child: TextField(
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter Discounted Price',
                      hintStyle: const TextStyle(
                        fontSize: 15,
                        color: Color(
                          0xff8c8c8c,
                        ),
                      )),
                  controller: _mainprice),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Variants added :",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(
                    width: 1.0,
                    color: primaryColor,
                  ),
                  backgroundColor: Colors.white,
                  minimumSize: Size(width, 45),
                ),
                child: Text(
                  "Add variant",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: primaryColor),
                ),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Varient()))),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Subcategory",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              decoration: shadowdecoration,
              child: TextField(
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Subcategory',
                      hintStyle: const TextStyle(
                        fontSize: 15,
                        color: Color(
                          0xff8c8c8c,
                        ),
                      )),
                  controller: _subcategory),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              decoration: shadowdecoration,
              child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Describe the product in 40-50 words',
                      hintStyle: const TextStyle(
                        fontSize: 15,
                        color: Color(
                          0xff8c8c8c,
                        ),
                      )),
                  controller: _productdiscription),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  "Is the product returnable? ",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                const Spacer(),
                Transform.scale(
                    scale: 1,
                    child: Switch(
                        onChanged: (value) {
                          ref.watch(isSwitchedProvider.notifier).state = value;
                          setState(() {});
                        },
                        value: isSwitched,
                        activeColor: primaryColor,
                        activeTrackColor: primary2Color,
                        inactiveThumbColor: Colors.grey,
                        inactiveTrackColor: Colors.grey.shade400))
              ],
            )
          ],
        ),
      ),
    );
  }
}
