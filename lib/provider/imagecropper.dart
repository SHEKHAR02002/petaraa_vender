import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

import 'package:image_picker/image_picker.dart';
import 'package:petaraa_vender/constant/color.dart';

Future cropImage({
  required XFile? pickedFile,
}) async {
  CroppedFile? croppedFileSeleted;
  if (pickedFile != null) {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 90,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            activeControlsWidgetColor: primaryColor,
            toolbarColor: primaryColor,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            hideBottomControls: true,
            lockAspectRatio: true),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    if (croppedFile != null) {
      croppedFileSeleted = croppedFile;
      return croppedFileSeleted.path.toString();
    } else {
      return pickedFile.path.toString();
    }
  }
  return pickedFile!.path.toString();
}

Future userImage({
  required XFile? pickedFile,
}) async {
  CroppedFile? croppedFileSeleted;
  if (pickedFile != null) {
    final croppedFile = await ImageCropper().cropImage(
      aspectRatioPresets: [CropAspectRatioPreset.original],
      cropStyle: CropStyle.circle,
      sourcePath: pickedFile.path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            activeControlsWidgetColor: primaryColor,
            toolbarColor: primaryColor,
            toolbarWidgetColor: Colors.white,
            hideBottomControls: true,
            lockAspectRatio: true),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    if (croppedFile != null) {
      croppedFileSeleted = croppedFile;
      return croppedFileSeleted.path.toString();
    } else {
      return pickedFile.path.toString();
    }
  }
  return pickedFile!.path.toString();
}

Future advertiseImage({
  required XFile? pickedFile,
}) async {
  CroppedFile? croppedFileSeleted;
  if (pickedFile != null) {
    final croppedFile = await ImageCropper().cropImage(
      aspectRatioPresets: [CropAspectRatioPreset.ratio16x9],
      cropStyle: CropStyle.rectangle,
      sourcePath: pickedFile.path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            activeControlsWidgetColor: primaryColor,
            toolbarColor: primaryColor,
            toolbarWidgetColor: Colors.white,
            hideBottomControls: true,
            lockAspectRatio: true),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    if (croppedFile != null) {
      croppedFileSeleted = croppedFile;
      return croppedFileSeleted.path.toString();
    } else {
      return pickedFile.path.toString();
    }
  }
  return pickedFile!.path.toString();
}
