import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petaraa_vender/constant/color.dart';
import 'package:petaraa_vender/screen/manegement_sub_screens/storetimingscreen.dart';
import 'package:petaraa_vender/widget/miscellaneous/decoration.dart';

class EditShopDetails extends StatefulWidget {
  const EditShopDetails({super.key});

  @override
  State<EditShopDetails> createState() => _EditShopDetailsState();
}

class _EditShopDetailsState extends State<EditShopDetails> {
  final TextEditingController _shopName = TextEditingController(),
      _address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text("Shop Details",
              style: TextStyle(
                fontFamily: "Autour",
                fontSize: 20,
                fontWeight: FontWeight.w400,
              )),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Shop name", style: text18_400),
                Container(
                  height: 45,
                  margin: const EdgeInsets.only(top: 5, bottom: 20),
                  decoration: shadowdecoration,
                  child: TextField(
                    style: text20_400,
                    controller: _shopName,
                    maxLength: 24,
                    decoration: InputDecoration(
                      counterText: "",
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                Text("Shop Address", style: text18_400),
                Container(
                  width: width,
                  margin: const EdgeInsets.only(top: 5, bottom: 20),
                  decoration: shadowdecoration,
                  child: TextField(
                    maxLines: 2,
                    keyboardType: TextInputType.multiline,
                    style: text20_400,
                    controller: _address,
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () async {
                          _address.clear();
                          _address.text = "";
                          //  await getLoction(context: context);
                        },
                        child: Icon(
                          CupertinoIcons.location_fill,
                          color:
                              _address.text == "" ? Colors.grey : primaryColor,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                Text("Contact Details", style: text18_400),
                Container(
                  height: 45,
                  margin: const EdgeInsets.only(top: 5, bottom: 20),
                  decoration: shadowdecoration,
                  child: TextField(
                    style: text20_400,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StoreTimingScreen())),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                                width: 0.2, color: Colors.grey)),
                        minimumSize: Size(width, 50),
                        elevation: 1),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Timings",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        Icon(Icons.arrow_forward_ios_rounded)
                      ],
                    )),
                const SizedBox(height: 20),
                Text(
                  "About Us",
                  style: text18_400,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 20),
                  decoration: shadowdecoration,
                  child: TextField(
                    maxLines: 2,
                    keyboardType: TextInputType.multiline,
                    style: text20_400,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(15),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                Text("Website link", style: text18_400),
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 20),
                  height: 45,
                  decoration: shadowdecoration,
                  child: TextField(
                    style: text20_400,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                Text("Add photos", style: text18_400),
                const SizedBox(height: 10),
                const Text(
                  "Internal Shop",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "you can add maximum 3 photo",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ),
                Container(
                  height: 80,
                  width: 80,
                  color: Colors.grey.shade300,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_circle_outline_rounded,
                      size: 42,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "External Shop",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "you can add maximum 3 photo",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ),
                Container(
                  height: 80,
                  width: 80,
                  color: Colors.grey.shade300,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_circle_outline_rounded,
                      size: 42,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "More Images",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "you can add maximum 3 photo",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ),
                Container(
                  height: 80,
                  width: 80,
                  color: Colors.grey.shade300,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_circle_outline_rounded,
                      size: 42,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
