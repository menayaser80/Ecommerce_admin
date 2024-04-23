import 'dart:io';

import 'package:admin_app/core/constant/color.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

imageUploadCamera() async {
  final PickedFile? file = (await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 90)) as PickedFile?;
  if(file!=null) {
    return File(file.path);
  }
  else{
    return null;
  }
}

imageUploadGallery([issvg = false]) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions:
          issvg ? ["svg", "SVG"] : ["PNG", "png", "jpg", "jpeg", "gif"]);
  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}
showbottommenu(imageUploadCamera(),imageUploadGallery())
{
Get.bottomSheet(
  Directionality(textDirection: TextDirection.rtl, child:Container(
    padding: EdgeInsets.all(10),
    height: 220,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:<Widget> [
Container(
  child: Text("Choose Image",style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 22,
    color: AppColor.primaryColor
  ),),
),
        Padding(padding: EdgeInsets.only(top: 10)),
        ListTile(
          onTap: (){
            imageUploadCamera();
            Get.back();
          },leading: Icon(
          Icons.camera_alt,size: 40,
        ),
          title: Text("صورة من الكاميرا",style: TextStyle(fontSize: 20),),
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        ListTile(
          onTap: (){
            imageUploadGallery();
            Get.back();
          },leading: Icon(
          Icons.image,size: 40,
        ),
          title: Text("صورة من الاستوديو",style: TextStyle(fontSize: 20),),
        ),
      ],
    ),
  )),
  backgroundColor: Colors.white
); 
}
