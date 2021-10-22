import 'dart:io';
import 'package:apartment_project/models/apartments.dart';
import 'package:apartment_project/shares/custom_color.dart';
import 'package:apartment_project/shares/vadidator.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'custom_form_field.dart';

class AddItemForm extends StatefulWidget {
  //define focus node
  final FocusNode apartmentNameFocusNode;
  final FocusNode addressFocusNode;
  final FocusNode furnitureFocusNode;
  final FocusNode typeFocusNode;
  final FocusNode numBedFocusNode;
  final FocusNode numKitFocusNode;
  final FocusNode numBathFocusNode;
  final FocusNode priceFocusNode;
  final FocusNode noteFocusNode;
  final FocusNode nameReporterFocusNode;

  const AddItemForm({
    required this.apartmentNameFocusNode,
    required this.addressFocusNode,
    required this.furnitureFocusNode,
    required this.typeFocusNode,
    required this.numBedFocusNode,
    required this.numKitFocusNode,
    required this.numBathFocusNode,
    required this.priceFocusNode,
    required this.noteFocusNode,
    required this.nameReporterFocusNode,
  });

  @override
  _AddItemFormState createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  final _addItemFormKey = GlobalKey<FormState>();
  final _listFurniture = [
    'Furnished',
    'Unfurnished',
    'Part Furnished'
  ];
  final _listType = [
    'Apartment',
    'Penthouse',
    'House',
    'Villa'
  ];
  bool _isProcessing = false;
  final TextEditingController _apartmentNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String? _furnitureController;
  String? _typeController;
  // TextEditingController _typeController = TextEditingController();
  final TextEditingController _numBedController = TextEditingController();
  final TextEditingController _numKitController = TextEditingController();
  final TextEditingController _numBathController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _nameReporterController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  //Picker Image Controller
  late File _image;
  final picker = ImagePicker();
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> _upload(ImageSource inputSource) async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: inputSource, maxWidth: 1920);

      final String fileName = path.basename(pickedImage!.path);
      File imageFile = File(pickedImage.path);

      try {
        // Uploading the selected image with some custom meta data
        await storage
            .ref(fileName)
            .putFile(imageFile, SettableMetadata(customMetadata: {}));

        // Refresh the UI
        setState(() {});
      } on FirebaseException catch (error) {
        print(error);
      }
    } catch (err) {
      print(err);
    }
  }

  // Delete the selected image
  // This function is called when a trash icon is pressed
  Future<void> _delete(String ref) async {
    await storage.ref(ref).delete();
    // Rebuild the UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _addItemFormKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                bottom: 24.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.0),
                  Text(
                    'Your name',
                    style: TextStyle(
                      color: CustomColors.firebaseWhite,
                      fontSize: 22.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomFormField(
                    isLabelEnabled: false,
                    controller: _nameReporterController,
                    focusNode: widget.nameReporterFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    validator: (value) => Validator.validateField(
                      value: value,
                    ),
                    label: 'Name',
                    hint: 'Enter your name...',
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Name Apartment',
                    style: TextStyle(
                      color: CustomColors.firebaseWhite,
                      fontSize: 22.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomFormField(
                    isLabelEnabled: false,
                    controller: _apartmentNameController,
                    focusNode: widget.apartmentNameFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    validator: (value) => Validator.validateField(
                      value: value,
                    ),
                    label: 'Apartment Name',
                    hint: 'Enter your apartment name...',
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Address',
                    style: TextStyle(
                      color: CustomColors.firebaseWhite,
                      fontSize: 22.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomFormField(
                    isLabelEnabled: false,
                    controller: _addressController,
                    focusNode: widget.addressFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    validator: (value) => Validator.validateField(
                      value: value,
                    ),
                    label: 'Address',
                    hint: 'Enter your address...',
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Type Furniture',
                    style: TextStyle(
                      color: CustomColors.firebaseWhite,
                      fontSize: 22.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  DropdownButtonFormField(
                      hint: const Text(
                        "Select property furniture",
                        style: TextStyle(color: Colors.black),
                      ),
                      icon: const Icon(Icons.home_filled),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      iconEnabledColor: Colors.lime,
                      focusNode: widget.furnitureFocusNode,
                      dropdownColor: Colors.blueAccent,
                      iconSize: 40,
                      onChanged: (val) => setState(() {
                        _furnitureController = val as String?;
                      }),
                      value: _furnitureController,
                      items: _listFurniture
                          .map((type) => DropdownMenuItem(
                                value: type,
                                child: Text(type),
                              ))
                          .toList()),
                  SizedBox(height: 8.0),
                  DropdownButtonFormField(
                      hint: const Text(
                        "Select property type",
                        style: TextStyle(color: Colors.black),
                      ),
                      icon: const Icon(Icons.home_work),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      iconEnabledColor: Colors.lime,
                      focusNode: widget.typeFocusNode,
                      dropdownColor: Colors.blueAccent,
                      iconSize: 40,
                      onChanged: (val) => setState(() {
                        _typeController = val as String?;
                      }),
                      value: _typeController,
                      items: _listType
                          .map((type) => DropdownMenuItem(
                        value: type,
                        child: Text(type),
                      ))
                          .toList()),
                  SizedBox(height: 24.0),
                  Text(
                    'Bedroom',
                    style: TextStyle(
                      color: CustomColors.firebaseWhite,
                      fontSize: 22.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomFormField(
                    isLabelEnabled: false,
                    controller: _numBedController,
                    focusNode: widget.numBedFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    validator: (value) => Validator.validateNumber(
                      value: value,
                    ),
                    label: 'Number',
                    hint: 'Enter a number of bedroom...',
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Kitten',
                    style: TextStyle(
                      color: CustomColors.firebaseWhite,
                      fontSize: 22.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomFormField(
                    isLabelEnabled: false,
                    controller: _numKitController,
                    focusNode: widget.numKitFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    validator: (value) => Validator.validateNumber(
                      value: value,
                    ),
                    label: 'Number',
                    hint: 'Enter a number of kitten...',
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Bedroom',
                    style: TextStyle(
                      color: CustomColors.firebaseWhite,
                      fontSize: 22.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomFormField(
                    isLabelEnabled: false,
                    controller: _numBathController,
                    focusNode: widget.numBathFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    validator: (value) => Validator.validateNumber(
                      value: value,
                    ),
                    label: 'Number',
                    hint: 'Enter a number of bathroom...',
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Monthly Price',
                    style: TextStyle(
                      color: CustomColors.firebaseWhite,
                      fontSize: 22.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomFormField(
                    isLabelEnabled: false,
                    controller: _priceController,
                    focusNode: widget.priceFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    validator: (value) => Validator.validateNumber(
                      value: value,
                    ),
                    label: 'Number',
                    hint: 'Enter the monthly price...',
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Note',
                    style: TextStyle(
                      color: CustomColors.firebaseWhite,
                      fontSize: 22.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomFormField(
                    maxLines: 10,
                    isLabelEnabled: false,
                    controller: _noteController,
                    focusNode: widget.noteFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    validator: (value) => Validator.validateOptional(
                      value: value,
                    ),
                    label: 'Note',
                    hint: 'Enter a note(optional)...',
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                            onPressed: () => _upload(ImageSource.camera),
                            icon: Icon(Icons.camera),
                            label: Text('Camera')),
                        ElevatedButton.icon(
                            onPressed: () => _upload(ImageSource.gallery),
                            icon: Icon(Icons.library_add),
                            label: Text('Gallery')),
                        ElevatedButton.icon(
                            onPressed: () => _delete(_image.path),
                            icon: Icon(Icons.delete),
                            label: Text('Delete')),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  _isProcessing
                      ? Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              CustomColors.firebaseOrange,
                            ),
                          ),
                        )
                      : Container(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                CustomColors.firebaseOrange,
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            onPressed: () async {
                              widget.apartmentNameFocusNode.unfocus();
                              widget.noteFocusNode.unfocus();

                              if (_addItemFormKey.currentState!.validate()) {
                                setState(() {
                                  _isProcessing = true;
                                });

                                await ApartmentData.addApartment(
                                  nameApm: _apartmentNameController.text,
                                  address: _addressController.text,
                                  furniture: _furnitureController.toString(),
                                  type: _typeController.toString(),
                                  numBath: int.parse(_numBathController.text),
                                  numBed: int.parse(_numBedController.text),
                                  numKit: int.parse(_numKitController.text),
                                  price: int.parse(_priceController.text),
                                  note: _noteController.text,
                                  nameOwn: _nameReporterController.text,
                                );

                                setState(() {
                                  _isProcessing = false;
                                });

                                Navigator.of(context).pop();
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                              child: Text(
                                'ADD ITEM',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColors.firebaseBlack,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            )
          ],
        ));
  }
}
