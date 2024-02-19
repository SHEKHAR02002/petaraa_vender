import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petaraa_vender/constant/color.dart';
import 'package:petaraa_vender/constant/variableconstat.dart';
import 'package:petaraa_vender/widget/miscellaneous/addphotowidget.dart';
import 'package:petaraa_vender/widget/miscellaneous/decoration.dart';

class UpdateShopDetail extends ConsumerStatefulWidget {
  const UpdateShopDetail({super.key});

  @override
  ConsumerState<UpdateShopDetail> createState() => _UpdateShopDetailState();
}

class _UpdateShopDetailState extends ConsumerState<UpdateShopDetail> {
  final TextEditingController _shopName = TextEditingController(),
      _shopaddress = TextEditingController(),
      _shopcontact = TextEditingController(),
      _shoptaboutus = TextEditingController(),
      _shopwebsite = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userdetails = ref.watch(userdetailsProvider);
    _shopName.text = userdetails.data!.shopData!.shopName.toString();
    _shopaddress.text = userdetails.data!.shopData!.shopAddress.toString();
    _shopcontact.text = userdetails.data!.shopData!.contactDetails.toString();
    _shoptaboutus.text = userdetails.data!.shopData!.aboutUs.toString();
    _shopwebsite.text = userdetails.data!.shopData!.websiteLink.toString();
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
        title: const Text("Edit Shop Details",
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
              TextField(
                controller: _shopName,
                textCapitalization: TextCapitalization.words,
                style: text16_400,
                decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.all(14),
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x1A333333),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x1A333333),
                        ),
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(height: 20),
              Text("Shop Address", style: text18_400),
              TextField(
                maxLines: 3,
                controller: _shopaddress,
                textCapitalization: TextCapitalization.words,
                style: text16_400,
                decoration: InputDecoration(
                    // suffixIcon: Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Align(
                    //     alignment: Alignment.topRight,
                    //     child: Icon(
                    //       CupertinoIcons.location_fill,
                    //       color: primaryColor,
                    //     ),
                    //   ),
                    // ),
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x1A333333),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x1A333333),
                        ),
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(height: 20),
              Text("Contact Details", style: text18_400),
              TextField(
                controller: _shopcontact,
                textCapitalization: TextCapitalization.words,
                style: text16_400,
                decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.all(14),
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x1A333333),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x1A333333),
                        ),
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(height: 20),
              Text(
                "About Us",
                style: text18_400,
              ),
              TextField(
                maxLines: 3,
                controller: _shoptaboutus,
                textCapitalization: TextCapitalization.words,
                style: text16_400,
                decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.all(15),
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x1A333333),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x1A333333),
                        ),
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(height: 20),
              Text("Website link", style: text18_400),
              TextField(
                controller: _shopwebsite,
                textCapitalization: TextCapitalization.words,
                style: text16_400,
                // onSubmitted: (value) async {
                //   if (value.isNotEmpty) {
                //     if (!await launchUrl(Uri.parse(value))) {
                //       if (!mounted) return;
                //       toast(msg: 'Wrong Url', context: context);
                //     }
                //   } else {
                //     _shopwebsite.text == '';
                //   }
                // },
                decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.all(14),
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x1A333333),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x1A333333),
                        ),
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(height: 20),
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
              const SizedBox(
                height: 10,
              ),
              addPhotoWidget(
                  ref: ref,
                  fun: () => setState(() {}),
                  typeofimage: 'internal'),
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
              addPhotoWidget(
                  ref: ref,
                  fun: () => setState(() {}),
                  typeofimage: 'external'),
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
              addPhotoWidget(
                  ref: ref, fun: () => setState(() {}), typeofimage: 'more')
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: primaryColor,
                minimumSize: Size(MediaQuery.of(context).size.width, 50)),
            child: const Text(
              "Update",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            )),
      ),
    );
  }
}
