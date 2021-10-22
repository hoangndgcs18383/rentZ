import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}
  bool _folded = true;
class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(microseconds: 400),
        width: _folded ? 56 : 200,
        height: 56,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.white,
            boxShadow: kElevationToShadow[6]),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 16),
                child: !_folded
                    ? TextField(
                  decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.blue[300]),
                      border: InputBorder.none),
                )
                    : null,
              ),
            ),
            AnimatedContainer(
              duration: Duration(microseconds: 400),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Icon(_folded ? Icons.search : Icons.close,
                      color: Colors.blue[900],
                    ),
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(_folded ? 32 : 0),
                      topRight: Radius.circular(32),
                      bottomLeft: Radius.circular(_folded ? 32 : 0)
                  ),
                  onTap: () {
                    setState(() {
                      _folded = !_folded;
                    });
                  },
                ),
              ),
            )
          ],
        ));
  }
}
