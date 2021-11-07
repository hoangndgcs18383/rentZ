import 'package:apartment_project/shares/custom_color.dart';
import 'package:apartment_project/widgets/custom_add_item_form.dart';
import 'package:apartment_project/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';


class AddScreen extends StatelessWidget {
  final FocusNode _apartmentNameFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();
  final FocusNode _cityFocusNode = FocusNode();
  final FocusNode _furnitureFocusNode = FocusNode();
  final FocusNode _typeFocusNode = FocusNode();
  final FocusNode _numBedFocusNode = FocusNode();
  final FocusNode _numKitFocusNode = FocusNode();
  final FocusNode _numBathFocusNode = FocusNode();
  final FocusNode _priceFocusNode = FocusNode();
  final FocusNode _noteFocusNode = FocusNode();
  final FocusNode _nameReporterFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _apartmentNameFocusNode.unfocus();
        _addressFocusNode.unfocus();
        _furnitureFocusNode.unfocus();
        _typeFocusNode.unfocus();
        _numBedFocusNode.unfocus();
        _numKitFocusNode.unfocus();
        _numBathFocusNode.unfocus();
        _priceFocusNode.unfocus();
        _noteFocusNode.unfocus();
        _nameReporterFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: CustomColors.firebaseNavy,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: SingleChildScrollView(
              child: AddItemForm(
                apartmentNameFocusNode: _apartmentNameFocusNode,
                addressFocusNode: _addressFocusNode,
                cityFocusNode: _cityFocusNode,
                furnitureFocusNode: _furnitureFocusNode,
                typeFocusNode: _typeFocusNode,
                numBathFocusNode: _numBathFocusNode,
                numKitFocusNode: _numKitFocusNode,
                numBedFocusNode: _numBedFocusNode,
                priceFocusNode: _priceFocusNode,
                nameReporterFocusNode: _nameReporterFocusNode,
                noteFocusNode: _noteFocusNode,
              ),
            ),
          ),
        ),
      ),
    );
  }
}