import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField(
    this.textInputType,
  );

  TextInputType textInputType;

  int? max;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: TextField(
          onTap: () {
            showSearch(context: context, delegate: SearchD());
          },
          keyboardType: textInputType,
          style: const TextStyle(
              color: Colors.black, fontSize: 16.5, fontWeight: FontWeight.w600),
          decoration: const InputDecoration(
            filled: true,
            fillColor: Color(0xffF2F3F2),
            hintText: 'Search Store',
            hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Color(0xff7C7C7C)),
            isDense: false,
            prefixIconConstraints:
                BoxConstraints(maxHeight: 19.9, minHeight: 19.9),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(Icons.search),
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          )),
    );
  }
}

class SearchD extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    assert(theme != null);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: colorScheme.brightness == Brightness.dark
            ? Colors.grey[900]
            : Colors.white,
        iconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
      ),
      inputDecorationTheme: searchFieldDecorationTheme ??
          InputDecorationTheme(
            hintStyle: searchFieldStyle ?? theme.inputDecorationTheme.hintStyle,
            border: InputBorder.none,
          ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {},
          icon: Image.asset(
            'assets/images/filter.png',
            height: 20,
          ))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Image.asset(
        'assets/images/arrow_back.png',
        height: 20,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Container(
      color: Colors.white,
    );
  }
}
