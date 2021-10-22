import 'package:apartment_project/models/apartments.dart';
import 'package:apartment_project/shares/custom_color.dart';
import 'package:apartment_project/widgets/custom_appbar.dart';
import 'package:apartment_project/widgets/custom_edit_form.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
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

  EditScreen({
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
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final FocusNode _apartmentNameFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();
  final FocusNode _furnitureFocusNode = FocusNode();
  final FocusNode _typeFocusNode = FocusNode();
  final FocusNode _numBedFocusNode = FocusNode();
  final FocusNode _numKitFocusNode = FocusNode();
  final FocusNode _numBathFocusNode = FocusNode();
  final FocusNode _priceFocusNode = FocusNode();
  final FocusNode _noteFocusNode = FocusNode();
  final FocusNode _nameReporterFocusNode = FocusNode();

  bool _isDeleting = false;

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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CustomColors.firebaseNavy,
          title: AppBarTitle(),
          actions: [
            _isDeleting
                ? const Padding(
              padding: EdgeInsets.only(
                top: 10.0,
                bottom: 10.0,
                right: 16.0,
              ),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.redAccent,
                ),
                strokeWidth: 3,
              ),
            )
                : IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.redAccent,
                size: 32,
              ),
              onPressed: () async {
                setState(() {
                  _isDeleting = true;
                });

                await ApartmentData.deleteApartment(
                  docId: widget.documentId,
                );

                setState(() {
                  _isDeleting = false;
                });

                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: SingleChildScrollView(
              child: EditItemForm(
                documentId: widget.documentId,
                //Focus node
                apartmentNameFocusNode: _apartmentNameFocusNode,
                addressFocusNode: _addressFocusNode,
                furnitureFocusNode: _furnitureFocusNode,
                typeFocusNode: _typeFocusNode,
                numBedFocusNode: _numBedFocusNode,
                numKitFocusNode: _numKitFocusNode,
                numBathFocusNode: _numBathFocusNode,
                priceFocusNode: _priceFocusNode,
                noteFocusNode: _noteFocusNode,
                nameReporterFocusNode: _nameReporterFocusNode,
                //edit
                currentApartmentName: widget.currentApartmentName,
                currentAddress: widget.currentAddress,
                currentFurniture: widget.currentFurniture,
                currentType: widget.currentType,
                currentNumBed: widget.currentNumBed,
                currentNumBath: widget.currentNumBath,
                currentNumKit: widget.currentNumKit,
                currentPrice: widget.currentPrice,
                currentNote: widget.currentNote,
                currentNameReporter: widget.currentNameReporter,
              ),
            ),
          ),
        ),
      ),
    );
  }
}