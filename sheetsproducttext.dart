import 'package:flutter/material.dart';
import 'package:shitalsurgicalco/data/productlist.dart';

var name;

class Sheetsproducttext extends StatefulWidget {
  const Sheetsproducttext(
      {super.key, required this.indexs, required this.list});
  final indexs;
  final List<String> list;

  @override
  State<Sheetsproducttext> createState() =>
      _SheetsproducttextState(indexs, list);
}

class _SheetsproducttextState extends State<Sheetsproducttext> {
  _SheetsproducttextState(this.index, this.list);
  final index;
  final list;
  var lable = 'Add';

  int quantity = 0;

  bool _isChecked = false;


  void function() {
    setState(() {
      if (_isChecked) {
        lable = 'Add';
        _isChecked = false;
        selecteditem.remove(list[index]);
      } else {
        lable = 'Remove';
        _isChecked = true;
        selecteditem.add(list[index]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Card(
        elevation: 8,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListTile(
                title: Text(list[index] , style: TextStyle(fontWeight: FontWeight.w600),),
                onTap: () {
                  name = list[index];
                  print(selecteditem);
                },
              ),
            ),
            TextButton(
              onPressed: function,
              child: Text(lable,style: const TextStyle(fontWeight: FontWeight.w600 , color: Colors.red)),
            )
          ],
        ),
      ),
    ]);
  }
}
