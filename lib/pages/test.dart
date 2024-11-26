import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sep/shared/shared.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uuid/uuid.dart';
import 'package:dropdown_search/dropdown_search.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  bool loading = true;

  List<String> items = [
    'Apple',
    'Orange',
    'Banana',
    'Grape',
    'Melon',
    'WaterMelon',
  ];

  String selectedItem = 'Select Item';

  void fetchData() {
    print(loading);
    Timer(Duration(seconds: 3), () {
      setState(() {
        loading = false;
      });
      print(loading);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //changeLocale(context, 'ar');
    fetchData();
    generateUUID();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translate("hello"),
          style: GoogleFonts.aBeeZee(
            color: Colors.white
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                if (locale == 'en') {
                  locale = 'ar';
                  changeLocale(context, locale);
                } else {
                  locale = 'en';
                  changeLocale(context, locale);
                }
              },
              icon: Icon(Icons.translate))
        ],
      ),
      body: loading
          ? Column(
              children: [
                shimmerLoadingRow(),
                shimmerLoadingRow(),
                shimmerLoadingRow(),
                shimmerLoadingRow(),
                shimmerLoadingRow(),
                shimmerLoadingRow(),
                shimmerLoadingRow(),
              ],
            )
          : ListView(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: DropdownSearch<String>(
                    popupProps: const PopupProps.menu(
                        showSearchBox: true,
                        showSelectedItems: true,
                        fit: FlexFit.loose,
                        constraints: BoxConstraints()),
                    items: (filter, infiniteScrollProps) => items,
                    onChanged: (value) {
                      print(value);

                      setState(() {
                        selectedItem = value!;
                      });
                    },
                    selectedItem: selectedItem,
                  ),
                ),
                product(),
                product(),
                product(),
                product(),
                product(),
                product(),
                product(),
              ],
            ),
    );
  }

  void generateUUID() {
    var uuid = Uuid();
    var v6 = uuid.v4(); // -> '1ebbc608-7459-6a20-bc85-0d10b6a52acd'
    print(v6);
  }

  Widget product() {
    return Row(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.red,
          highlightColor: Colors.red,
          enabled: true,
          child: Container(
            margin: EdgeInsets.all(10),
            height: locale == 'en' ? 100 : 50,
            width: 100,
            color: Colors.red,
          ),
        ),
        Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.red,
              highlightColor: Colors.red,
              enabled: true,
              child: Container(
                margin: EdgeInsets.all(10),
                height: 10,
                width: MediaQuery.of(context).size.width - 150,
                color: Colors.red,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.red,
              highlightColor: Colors.red,
              enabled: true,
              child: Container(
                margin: EdgeInsets.all(10),
                height: 10,
                width: MediaQuery.of(context).size.width - 150,
                color: Colors.red,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.red,
              highlightColor: Colors.red,
              enabled: true,
              child: Container(
                margin: EdgeInsets.all(10),
                height: 10,
                width: MediaQuery.of(context).size.width - 150,
                color: Colors.red,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.red,
              highlightColor: Colors.red,
              enabled: true,
              child: Container(
                margin: EdgeInsets.all(10),
                height: 10,
                width: MediaQuery.of(context).size.width - 150,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget shimmerLoadingRow() {
    return Row(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.grey.shade100,
          enabled: true,
          child: Container(
            margin: EdgeInsets.all(10),
            height: 100,
            width: 100,
            color: Colors.grey,
          ),
        ),
        Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.grey.shade100,
              enabled: true,
              child: Container(
                margin: EdgeInsets.all(10),
                height: 10,
                width: MediaQuery.of(context).size.width - 150,
                color: Colors.grey,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.grey.shade100,
              enabled: true,
              child: Container(
                margin: EdgeInsets.all(10),
                height: 10,
                width: MediaQuery.of(context).size.width - 150,
                color: Colors.grey,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.grey.shade100,
              enabled: true,
              child: Container(
                margin: EdgeInsets.all(10),
                height: 10,
                width: MediaQuery.of(context).size.width - 150,
                color: Colors.grey,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.grey.shade100,
              enabled: true,
              child: Container(
                margin: EdgeInsets.all(10),
                height: 10,
                width: MediaQuery.of(context).size.width - 150,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
