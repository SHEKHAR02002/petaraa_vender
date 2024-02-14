import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petaraa_vender/constant/color.dart';
import 'package:petaraa_vender/provider/imagecropper.dart';

class AdsScreen extends ConsumerStatefulWidget {
  const AdsScreen({super.key});

  @override
  ConsumerState<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends ConsumerState<AdsScreen> {
  String adImage = "";
  Future<dynamic> takeImages({required source}) async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: source);
      final File file = File(image!.path);
      String cropFile = await advertiseImage(pickedFile: XFile(file.path));
      setState(() {
        adImage = cropFile;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ads With Petaraa',
            style: TextStyle(
                fontSize: 20,
                color: primaryColor,
                fontWeight: FontWeight.w400)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () async {
                    await takeImages(source: ImageSource.gallery);
                  },
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      const Text('Upload Your Own Image',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400)), // <-- Text

                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 10, 10, 10),
                        child: SvgPicture.asset("assets/upload_image.svg",
                            width: 30, height: 30),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: primaryColor75,
                  ),
                  onPressed: () {
// Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const SelectTemplate()));
                  },
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      const Text('Select Template from Below ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400)),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset("assets/add_template.svg",
                            width: 30, height: 30),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: adImage.isEmpty
                    ? const SizedBox.shrink()
                    : Image.file(
                        File(adImage),
                        fit: BoxFit.contain,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
