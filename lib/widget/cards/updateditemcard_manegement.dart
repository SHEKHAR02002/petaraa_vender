import 'package:flutter/material.dart';
import 'package:petaraa_vender/constant/color.dart';

class UpdateItemsCard extends StatelessWidget {
  final String itemname, price, net;

  const UpdateItemsCard(
      {super.key,
      required this.itemname,
      required this.price,
      required this.net});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 0.4, color: Colors.grey),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: Image.asset(
              "assets/images/Petaraa_splash.png",
              height: 64,
              width: 64,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      itemname,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.cancel_rounded,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
                Text(
                  "Price: ₹$price",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Net: $net",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            minimumSize: const Size(80, 24)),
                        child: const Text(
                          "Edit",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
