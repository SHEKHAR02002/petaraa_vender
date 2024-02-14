import 'package:flutter/material.dart';
import 'package:petaraa_vender/constant/color.dart';
import 'package:petaraa_vender/data/categorydata.dart';

Future addcategorybottomsheet(
    {required BuildContext context,
    // required Function getcategory,
    required List<CategoryData> categorydataList}) {
  ScrollController controller = ScrollController();
  return showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      backgroundColor: white,
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.7,
            minChildSize: 0.5,
            maxChildSize: 1.0,
            builder: ((context, scrollController) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Category",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: primaryColor),
                    ),
                  ),
                  Flexible(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(), // new
                        controller: controller,
                        itemCount: categorydataList.length,
                        itemBuilder: (_, index) {
                          var data = categorydataList[index];
                          return InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              // ignore: avoid_unnecessary_containers
                              child: Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          color: primary4Color,
                                          height: 70,
                                          width: 70,
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Text(data.heading)
                                      ],
                                    ),
                                    const Divider(),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              );
            }));
      });
}
