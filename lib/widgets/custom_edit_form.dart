import 'dart:io';
import 'package:apartment_project/shares/const.dart';
import 'package:path/path.dart' as path;
import 'package:apartment_project/models/apartments.dart';
import 'package:apartment_project/shares/custom_color.dart';
import 'package:apartment_project/shares/vadidator.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'custom_form_field.dart';

class EditItemForm extends StatefulWidget {
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
  //define values
  final String currentApartmentName;
  final String currentAddress;
  final String currentFurniture;
  final String currentType;
  final int currentNumBed, currentNumKit, currentNumBath;
  final int currentPrice;
  final String currentNote;
  final String currentNameReporter;
  final String documentId;

  const EditItemForm({
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
    required this.currentApartmentName,
    required this.currentAddress,
    required this.currentFurniture,
    required this.currentType,
    required this.currentNumBed,
    required this.currentNumKit,
    required this.currentNumBath,
    required this.currentPrice,
    required this.currentNote,
    required this.currentNameReporter,
    required this.documentId,
  });

  @override
  _EditItemFormState createState() => _EditItemFormState();
}

class _EditItemFormState extends State<EditItemForm> {
  final _editItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;
  final _listFurniture = [
    'Furnished', 'Unfurnished', 'Part Furnished'
  ];
  final _listType = [
    'Apartment',
    'Penthouse',
    'House',
    'Villa'
  ];
  late TextEditingController _apartmentNameController;
  late TextEditingController _addressController;
  late TextEditingController _furnitureController;
  late TextEditingController _typeController;
  late TextEditingController _noteController;
  late TextEditingController _nameReporterController;
  late TextEditingController _numBedController;
  late TextEditingController _numKitController;
  late TextEditingController _numBathController ;
  late TextEditingController _priceController;

  @override
  void initState() {
    _apartmentNameController = TextEditingController(
      text: widget.currentApartmentName,
    );
    _addressController = TextEditingController(
      text: widget.currentAddress,
    );
    _furnitureController = TextEditingController(
      text: widget.currentFurniture,
    );
    _typeController = TextEditingController(
      text: widget.currentType,
    );
    _noteController = TextEditingController(
      text: widget.currentNote,
    );
    _nameReporterController = TextEditingController(
      text: widget.currentNameReporter,
    );
    _numBedController = TextEditingController(
      text: widget.currentNumBed.toString()
    );
    _numKitController = TextEditingController(
      text: widget.currentNumBed.toString()
    );
    _numBathController = TextEditingController(
      text: widget.currentNumBath.toString()
    );
    _priceController = TextEditingController(
      text: widget.currentPrice.toString()
    );

    super.initState();
  }


  late File _image;
  late PickedFile _imageFile;
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

  Future<void> _delete(String ref) async {
    await storage.ref(ref).delete();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _editItemFormKey,
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
                  'Rental Name',
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
                  label: 'Rental Name',
                  hint: 'Enter your rental name...',
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
                  'Property Furniture',
                  style: TextStyle(
                    color: CustomColors.firebaseWhite,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                DropdownButtonFormField(
                    onTap: () => FocusScope.of(context).unfocus(),
                    hint: const Text("Select property furniture",
                      style: TextStyle(
                          color: Colors.deepOrangeAccent
                      ),),
                    icon: const Icon(Icons.home_filled),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent,
                    ),
                    iconEnabledColor: Colors.lime,
                    focusNode: widget.furnitureFocusNode,
                    dropdownColor: Colors.limeAccent,
                    iconSize: 40,
                    value: _furnitureController.text,
                    onChanged: (val) => _furnitureController.text = val.toString(),
                    items: _listFurniture.map((type) =>
                        DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        )).toList()
                ),

                SizedBox(height: 24.0),
                Text(
                  'Property Type',
                  style: TextStyle(
                    color: CustomColors.firebaseWhite,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                DropdownButtonFormField(
                    onTap: () => FocusScope.of(context).unfocus(),
                    hint: const Text("Select property type",
                      style: TextStyle(
                          color: Colors.deepOrangeAccent
                      ),),
                    icon: const Icon(Icons.home_work),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent,
                    ),
                    iconEnabledColor: Colors.lime,
                    focusNode: widget.typeFocusNode,
                    dropdownColor: Colors.limeAccent,
                    iconSize: 40,
                    value: _typeController.text,
                    onChanged: (val) => _typeController.text = val.toString(),
                    items: _listType.map((type) =>
                        DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        )).toList()
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
                  validator: (value) => Validator.validatePrice(
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
                SizedBox(height: 8.0),
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
              ],
            ),
          ),

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
                showDialog(
                    context: context,
                    builder: (_context){
                      return AlertDialog(
                        title: Text("Confirm your information",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        content: Text(
                          'Name Reporter: ' + _nameReporterController.text + '\n\n' +
                              'Rental name: ' + _apartmentNameController.text + '\n\n' +
                              'Furniture: ' + _furnitureController.text + '\n\n' +
                              'Type: ' + _typeController.text + '\n\n' +
                              'Number of Bedroom: ' + _numBedController.text + '\n\n' +
                              'Number of Kitten: ' + _numKitController.text + '\n\n' +
                              'Number of Bathroom: ' + _numBathController.text + '\n\n' +
                              'Price: ' + _priceController.text + '\n\n' +
                              'Note: ' + _noteController.text + '\n\n'
                          ,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () async {
                                setState(() async {
                                  widget.apartmentNameFocusNode.unfocus();
                                  widget.noteFocusNode.unfocus();
                                  if (_editItemFormKey.currentState!.validate()) {
                                    setState(() {
                                      Navigator.of(context).pop();
                                      _isProcessing = true;
                                    });
                                    await ApartmentData.updateApartment(
                                      docId: widget.documentId,
                                      nameApm: _apartmentNameController.text,
                                      address: _addressController.text,
                                      furniture: _furnitureController.text,
                                      type: _typeController.text,
                                      numBath: int.parse(_numBathController.text),
                                      numBed: int.parse(_numBedController.text),
                                      numKit: int.parse(_numKitController.text),
                                      price: int.parse(_priceController.text),
                                      note: _noteController.text,
                                      nameOwn: _nameReporterController.text,
                                    );
                                    Navigator.of(context).pop();
                                  }
                                });
                                Navigator.of(context).pop();
                              },
                              child: Text("Yes", style: dialogTextStyle,)),
                          TextButton(
                              onPressed: (){
                                setState(() {
                                  _isProcessing = false;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text("No", style: dialogTextStyle,)),
                        ],
                        elevation: 24.0,
                        backgroundColor: CustomColors.firebaseWhite,
                      );
                    });
                widget.apartmentNameFocusNode.unfocus();
                widget.noteFocusNode.unfocus();

              },
              child: Padding(
                padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Text(
                  'UPDATE ITEM',
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
    );
  }
}