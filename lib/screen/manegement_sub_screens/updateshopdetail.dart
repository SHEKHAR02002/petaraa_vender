import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petaraa_vender/api/shopapi.dart';
import 'package:petaraa_vender/constant/color.dart';
import 'package:petaraa_vender/constant/variableconstat.dart';
import 'package:petaraa_vender/widget/miscellaneous/addphotowidget.dart';
import 'package:petaraa_vender/widget/miscellaneous/decoration.dart';
import 'package:petaraa_vender/widget/miscellaneous/toastui.dart';
import 'package:petaraa_vender/widget/popups/imageupdate_popup.dart';

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

  submitbtnfuncation() {
    final shopdetails = ref.watch(shopdetailsProvider);
    if (_shopName.text.isNotEmpty &&
        _shopaddress.text.isNotEmpty &&
        _shopcontact.text.isNotEmpty &&
        _shoptaboutus.text.isNotEmpty) {
      FormData requestBody = FormData.fromMap({
        'shopName': _shopName.text,
        'shopAddress': _shopaddress.text,
        'contactDetails': _shopcontact.text,
        'aboutUs': _shoptaboutus.text,
        'websiteLink': _shopwebsite.text,
      });

      if (shopdetails!.internalShopImages!.isEmpty) {
        for (int i = 0;
            i < ref.watch(internalImageProvider.notifier).state.length;
            i++) {
          requestBody.files.add(MapEntry(
            'internalShopImage${i + 1}',
            MultipartFile.fromFileSync(
              ref.watch(internalImageProvider.notifier).state[i].toString(),
            ),
          ));
        }
      }
      if (shopdetails.externalShopImages!.isEmpty) {
        for (int i = 0;
            i < ref.watch(externalImageProvider.notifier).state.length;
            i++) {
          requestBody.files.add(MapEntry(
            'externalShopImage${i + 1}',
            MultipartFile.fromFileSync(
              ref.watch(externalImageProvider.notifier).state[i].toString(),
            ),
          ));
        }
      }
      if (shopdetails.externalShopImages!.isEmpty) {
        for (int i = 0;
            i < ref.watch(moreImageProvider.notifier).state.length;
            i++) {
          requestBody.files.add(MapEntry(
            'extraImages${i + 1}',
            MultipartFile.fromFileSync(
              ref.watch(moreImageProvider.notifier).state[i].toString(),
            ),
          ));
        }
      }

      Shop()
          .updateShop(requestBody: requestBody, context: context)
          .whenComplete(() {
        Navigator.pop(context);
        ref.watch(internalImageProvider.notifier).state = [];
        ref.watch(externalImageProvider.notifier).state = [];
        ref.watch(moreImageProvider.notifier).state = [];
        _shopName.clear();
        _shopaddress.clear();
        _shopcontact.clear();
        _shoptaboutus.clear();
        _shopwebsite.clear();
      });
    } else {
      toast(msg: 'All Fields Requried', context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final shopdetails = ref.watch(shopdetailsProvider);
    _shopName.text = shopdetails!.shopName.toString();
    _shopaddress.text = shopdetails.shopAddress.toString();
    _shopcontact.text = shopdetails.contactDetails.toString();
    _shoptaboutus.text = shopdetails.aboutUs.toString();
    _shopwebsite.text = shopdetails.websiteLink.toString();
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
                onSubmitted: (value) => _shopName.text = value,
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
              shopdetails.internalShopImages!.isEmpty
                  ? addPhotoWidget(
                      ref: ref,
                      fun: () => setState(() {}),
                      typeofimage: 'internal')
                  : SizedBox(
                      height: 84,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: shopdetails.internalShopImages!.length,
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 10);
                          },
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => showDialog(
                                builder: (context) => imageupdate(
                                    ref: ref,
                                    image:
                                        "$photobaseurl/${shopdetails.internalShopImages![index].path.toString()}"),
                                context: context,
                              ),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                        '$photobaseurl/${shopdetails.internalShopImages![index].path.toString()}',
                                      )),
                                ),
                              ),
                            );
                          }),
                    ),
              const SizedBox(height: 10),
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
              shopdetails.externalShopImages!.isEmpty
                  ? addPhotoWidget(
                      ref: ref,
                      fun: () => setState(() {}),
                      typeofimage: 'external')
                  : SizedBox(
                      height: 84,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: shopdetails.externalShopImages!.length,
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 10);
                          },
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => showDialog(
                                builder: (context) => imageupdate(
                                    ref: ref,
                                    image:
                                        "$photobaseurl/${shopdetails.externalShopImages![index].path.toString()}"),
                                context: context,
                              ),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          "$photobaseurl/${shopdetails.externalShopImages![index].path.toString()}")),
                                ),
                              ),
                            );
                          }),
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
              shopdetails.extraImages!.isEmpty
                  ? addPhotoWidget(
                      ref: ref, fun: () => setState(() {}), typeofimage: 'more')
                  : SizedBox(
                      height: 80,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: shopdetails.extraImages!.length,
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 10);
                          },
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => showDialog(
                                builder: (context) => imageupdate(
                                    ref: ref,
                                    image:
                                        "$photobaseurl/${shopdetails.extraImages![index].path.toString()}"),
                                context: context,
                              ),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          "$photobaseurl/${shopdetails.extraImages![index].path.toString()}")),
                                ),
                              ),
                            );
                          }),
                    ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: ElevatedButton(
            onPressed: submitbtnfuncation,
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
