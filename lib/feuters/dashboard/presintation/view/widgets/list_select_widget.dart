import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class ListSelectWidget extends StatefulWidget {
  const ListSelectWidget({
    super.key,
    required this.dataList,
    required this.valueList,
    required this.hintText,
    required this.onChanged,
    this.listKey,
  });
  final List<String> dataList;
  final List<String> valueList;
  final String hintText;
  final void Function(String?)? onChanged;
  final Key? listKey;
  @override
  State<ListSelectWidget> createState() => _ListSelectWidgetState();
}

class _ListSelectWidgetState extends State<ListSelectWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      key: widget.listKey,
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        // Add more decoration..
      ),
      hint: Text(
        widget.hintText,
        style: const TextStyle(fontSize: 14),
      ),
      items: List.generate(
          widget.dataList.length,
          (index) => DropdownMenuItem<String>(
                value: widget.valueList[index],
                child: Text(
                  widget.dataList[index],
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              )),
      validator: (value) {
        if (value == null) {
          return 'Please select item.';
        }
        return null;
      },
      onChanged: widget.onChanged,
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
