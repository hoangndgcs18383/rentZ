import 'package:apartment_project/models/apartments.dart';
import 'package:apartment_project/shares/custom_color.dart';
import 'package:apartment_project/shares/vadidator.dart';
import 'package:flutter/material.dart';

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
                    hint: const Text("Select type furniture",
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
                widget.apartmentNameFocusNode.unfocus();
                widget.noteFocusNode.unfocus();

                if (_editItemFormKey.currentState!.validate()) {
                  setState(() {
                    _isProcessing = true;
                  });

                  await ApartmentData.updateApartment(
                    docId: widget.documentId,
                    nameApm: _apartmentNameController.text,
                    address: _addressController.text,
                    furniture: _furnitureController.text,
                    type: _typeController.text,
                    numBath: widget.currentNumBath,
                    numBed: widget.currentNumBed,
                    numKit: widget.currentNumKit,
                    price: widget.currentPrice,
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