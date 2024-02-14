import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petaraa_vender/constant/color.dart';

Widget selecteimagetype() {
  return Dialog(
    insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 200),
    child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            popUpCard(
              // fun: takeproductimage(source: ImageSource.camera),
              heading: "Search Images",
              subheading: "Find Image of the Product",
              icon: CupertinoIcons.search,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            popUpCard(
              // fun: takeproductimage(source: ImageSource.camera),
              heading: "Take Picture",
              subheading: "Use Camera to click the pictures",
              icon: CupertinoIcons.camera,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            popUpCard(
              // fun: takeproductimage(source: ImageSource.camera),
              heading: "Choose from Gallery",
              subheading: "Browse gallery",
              icon: CupertinoIcons.photo,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            popUpCard(
              // fun: takeproductimage(source: ImageSource.camera),
              heading: "Multiple Image",
              subheading: "Select Multiple pictures",
              icon: CupertinoIcons.photo,
            ),
          ],
        )),
  );
}

Widget popUpCard({
  required String heading,
  required String subheading,
  required IconData icon,
  // required Function fun
}) {
  return InkWell(
    // onTap: () => fun,
    child: SizedBox(
      child: Row(
        children: [
          Icon(
            icon,
            size: 30,
            color: primaryColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                heading,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              Text(
                subheading,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(
                    0xff8c8c8c,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
