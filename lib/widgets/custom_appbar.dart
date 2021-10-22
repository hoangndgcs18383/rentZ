import 'package:apartment_project/shares/custom_color.dart';
import 'package:flutter/material.dart';


class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 8),
          Text(
            'Application ',
            style: TextStyle(
              color: CustomColors.firebaseYellow,
              fontSize: 18,
            ),
          ),
          Text(
            'RentZ',
            style: TextStyle(
              color: CustomColors.firebaseOrange,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}