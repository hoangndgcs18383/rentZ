import 'package:apartment_project/widgets/search_bar/custom_search_bar.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: (){
          showSearch(
              context: context,
              delegate: Search());
        },
        icon: Icon(Icons.search, size: 32,));
  }
}
