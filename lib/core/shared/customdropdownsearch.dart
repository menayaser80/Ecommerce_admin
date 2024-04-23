import 'package:drop_down_list/drop_down_list.dart';
import 'package:flutter/material.dart';
import 'package:drop_down_list/model/selected_list_item.dart';

class Customdropdownsearch extends StatefulWidget {
  final String? title;
  final List<SelectedListItem> listdata;
  final TextEditingController dropdownname;
  final TextEditingController dropdownid;

  const Customdropdownsearch(
      {super.key,
      this.title,
      required this.listdata,
      required this.dropdownname,
      required this.dropdownid});

  @override
  State<Customdropdownsearch> createState() => _CustomdropdownsearchState();
}

class _CustomdropdownsearchState extends State<Customdropdownsearch> {
  void showdropdownsearch() {
    DropDownState(
      DropDown(
        isDismissible: true,
        bottomSheetTitle: Text(
          widget.title!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        clearButtonChild: const Text(
          'Clear',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.listdata ?? [],
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          widget.dropdownname.text = selectedListItem.name;
          widget.dropdownid.text = selectedListItem.value!;
        },
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.dropdownname,
      cursorColor: Colors.black,
      onTap: () {
        FocusScope.of(context).unfocus();
        showdropdownsearch();
      },
      decoration: InputDecoration(
          hintText: widget.dropdownname.text == ""
              ? widget.title
              : widget.dropdownname.text,
          hintStyle: const TextStyle(fontSize: 14),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 9),
              child: Text(
                widget.dropdownname.text == ""
                    ? widget.title!
                    : widget.dropdownname.text,
              )),
          suffixIcon:
              InkWell(child: Icon(Icons.arrow_drop_down), onTap: (){}),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      // decoration: InputDecoration(
      //   filled: true,
      //   fillColor: Colors.black12,
      //   contentPadding:
      //       const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
      //   hintText:widget.dropdownname.text==""?widget.title:widget.dropdownname.text,
      //   border: const OutlineInputBorder(
      //     borderSide: BorderSide(
      //       width: 0,
      //       style: BorderStyle.none,
      //     ),
      //     borderRadius: BorderRadius.all(
      //       Radius.circular(8.0),
      //     ),
      //   ),
      // ),
    );
  }
}
