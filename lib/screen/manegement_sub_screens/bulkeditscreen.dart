import 'package:flutter/material.dart';
import 'package:petaraa_vender/constant/color.dart';
import 'package:petaraa_vender/widget/cards/updateditemcard_manegement.dart';

class BulkEditScreen extends StatelessWidget {
  const BulkEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Bulk Products',
            style: TextStyle(
                fontSize: 20,
                fontFamily: "Autour",
                color: primaryColor,
                fontWeight: FontWeight.w400)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                  onPressed: () {
                    // downlodfile();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(158, 252, 143, 1),
                      foregroundColor: Colors.black,
                      minimumSize: Size(width, 50),
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    "Get The Sample CSV File",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 25),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(255, 111, 111, 1),
                        minimumSize: Size(width, 50),
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add the CSV File",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        Icon(Icons.add_box_rounded),
                      ],
                    )),
              ),
              Text(
                "Items to update",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: primaryColor),
              ),
              const UpdateItemsCard(
                itemname: 'Manipokco pants for dogs',
                net: '500',
                price: '899',
              )
            ],
          ),
        ),
      ),
    );
  }
}
