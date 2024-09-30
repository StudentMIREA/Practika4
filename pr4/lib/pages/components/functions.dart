import 'package:flutter/material.dart';
import 'package:pr4/model/items.dart';
import 'package:pr4/pages/AddPage.dart';

List<Items> items = [];

void NavToAdd(BuildContext context) async {
  Items item = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AddPage()),
  );

  items.add(item);
}

void remItem(int i) {
  items.removeAt(i);
  print(items);
}
/*
void NavToAdd(BuildContext context) async {
  final item = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AddPage()),
  );

  if (item != null && item.isNotEmpty) {
    setState(() {
      items.add(item);
    });
  }
}

void remItem(int i) {
  setState(() {
    items.removeAt(i);
    print(items);
  });
}
*/

int findIndexById(int id) {
  return items.indexWhere((item) => item.id == id);
}
