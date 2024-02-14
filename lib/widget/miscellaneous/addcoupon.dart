import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petaraa_vender/constant/color.dart';
import 'package:petaraa_vender/widget/miscellaneous/decoration.dart';

class AddCoupons extends ConsumerStatefulWidget {
  const AddCoupons({super.key});

  @override
  ConsumerState<AddCoupons> createState() => _AddCouponsState();
}

class _AddCouponsState extends ConsumerState<AddCoupons> {
  final TextEditingController _couponname = TextEditingController();
  final TextEditingController _discription = TextEditingController();
  final TextEditingController _flatamount = TextEditingController();
  final TextEditingController _percentage = TextEditingController();
  final TextEditingController _minorder = TextEditingController();
  final TextEditingController _maxdiscount = TextEditingController();
  final TextEditingController _howtouse = TextEditingController();
  final TextEditingController _tandc = TextEditingController();
  final TextEditingController _validity = TextEditingController();
  final TextEditingController _petcoinvalue = TextEditingController();

  final List discounttype = ["Percent", "Flat Discount"];
  String? dtype = "Percent";
  bool dcheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: primary4Color,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Add Coupon Details",
            style: TextStyle(
                fontFamily: "Autour",
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: primary4Color)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Coupon Name", style: text18_400),
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 20),
                  height: 50,
                  decoration: shadowdecoration,
                  child: TextField(
                    style: text20_400,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(15),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    controller: _couponname,
                  ),
                ),
                Text("Description", style: text18_400),
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 20),
                  height: 50,
                  decoration: shadowdecoration,
                  child: TextField(
                    maxLines: 3,
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
                    controller: _discription,
                  ),
                ),
                Text("Discount Type", style: text18_400),
                DropdownButtonHideUnderline(
                  child: Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 20),
                    width: MediaQuery.of(context).size.width,
                    decoration: shadowdecoration,
                    child: DropdownButton2(
                      items: discounttype
                          .map((item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Overpass'),
                                ),
                              ))
                          .toList(),
                      value: dtype,
                      onChanged: (value) {
                        setState(() {
                          dtype = value as String;
                        });
                        if (dtype == 'Flat Discount') {
                          setState(() {
                            dcheck = true;
                          });
                        } else {
                          setState(() {
                            dcheck = false;
                          });
                        }
                      },
                    ),
                  ),
                ),
                dcheck
                    ? Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 5, bottom: 20),
                            height: 50,
                            width: 155,
                            decoration: shadowdecoration,
                            child: TextField(
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(15),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: "Flat amount",
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              controller: _flatamount,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            margin: const EdgeInsets.only(top: 5, bottom: 20),
                            height: 50,
                            width: 155,
                            decoration: shadowdecoration,
                            child: TextField(
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(15),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: "Min.order",
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              controller: _minorder,
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 5, bottom: 20),
                            height: 50,
                            width: 155,
                            decoration: shadowdecoration,
                            child: TextField(
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(15),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: "percent",
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              controller: _percentage,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            margin: const EdgeInsets.only(top: 5, bottom: 20),
                            height: 50,
                            width: 155,
                            decoration: shadowdecoration,
                            child: TextField(
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(15),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: "Min.order",
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              controller: _minorder,
                            ),
                          ),
                        ],
                      ),
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 20),
                  height: 50,
                  decoration: shadowdecoration,
                  child: TextField(
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(15),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Max. possible discount",
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    controller: _maxdiscount,
                  ),
                ),
                Text("How to use", style: text18_400),
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 20),
                  decoration: shadowdecoration,
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                    style: text20_400,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(15),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    controller: _howtouse,
                  ),
                ),
                Text(
                  "Terms and Conditions",
                  style: text18_400,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 20),
                  decoration: shadowdecoration,
                  child: TextField(
                    maxLines: 3,
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
                    controller: _tandc,
                  ),
                ),
                Text(
                  "Validity",
                  style: text18_400,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 20),
                  height: 50,
                  decoration: shadowdecoration,
                  child: TextField(
                    style: text20_400,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(15),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    controller: _validity,
                  ),
                ),
                Text(
                  "PetCoins value",
                  style: text18_400,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 20),
                  height: 50,
                  decoration: shadowdecoration,
                  child: TextField(
                    style: text20_400,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(15),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    controller: _petcoinvalue,
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        fixedSize: const Size(350, 50)),
                    onPressed: () {},
                    child: Text(
                      "Add Coupon",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: white),
                    )),
              ],
            )),
      ),
    );
  }
}
