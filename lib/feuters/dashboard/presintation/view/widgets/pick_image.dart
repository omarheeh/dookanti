import 'dart:developer';
import 'dart:typed_data';

import 'package:dookanti/core/servise/storage_servise.dart';
import 'package:dookanti/feuters/dashboard/presintation/view_model/add_category/add_category_cubit.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:dookanti/core/functions/methods.dart';
import 'package:flutter/material.dart';

class PickImgae extends StatefulWidget {
  const PickImgae({
    super.key,
  });

  @override
  State<PickImgae> createState() => _PickImgaeState();
}

class _PickImgaeState extends State<PickImgae> {
  Uint8List? _image;
  void selectImage() async {
    Uint8List img = await Methods.selectImage(ImageSource.gallery);

    BlocProvider.of<AddCategoryCubit>(context).file = img;
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _image != null
            ? Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 1),
                      blurRadius: 4,
                      color: Colors.grey.shade300,
                    ),
                  ],
                ),
                child: Image.memory(
                  _image!,
                  fit: BoxFit.cover,
                ),
              )
            : Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 1),
                      blurRadius: 4,
                      color: Colors.grey.shade300,
                    ),
                  ],
                ),
                child: Image.asset('assets/image/pickimage.jpg'),
              ),
        Positioned(
          right: 0,
          bottom: 0,
          child: IconButton(
            onPressed: selectImage,
            icon: Icon(
              Icons.add_a_photo,
            ),
          ),
        ),
      ],
    );
  }
}
