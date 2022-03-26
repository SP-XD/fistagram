import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
  return SingleChildScrollView(
      child: SafeArea(child: Container(
        alignment: Alignment.center, 
        child: Text('Search Page'),)),
    );
  }
}