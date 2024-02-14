import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petaraa_vender/constant/color.dart';
import 'package:petaraa_vender/widget/miscellaneous/decoration.dart';

class Varient extends StatefulWidget {
  const Varient({super.key});

  @override
  State<Varient> createState() => _VarientState();
}

class _VarientState extends State<Varient> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Variants",
          style: TextStyle(
              fontFamily: 'Autour',
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: shadowdecoration,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          CupertinoIcons.add_circled,
                          size: 50,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Variant",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: width / 2,
                            height: 30,
                            decoration: shadowdecoration,
                            child: TextField(
                              style: const TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(12)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              // controller: _brandname
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Variant Pricing",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: width / 2,
                            height: 30,
                            decoration: shadowdecoration,
                            child: TextField(
                              style: const TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(12)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              // controller: _brandname
                            ),
                          ),
                        ],
                      )
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset(
                      "assets/delete.svg",
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: primaryColor,
          child: const Icon(CupertinoIcons.add)),
    );
  }
}
