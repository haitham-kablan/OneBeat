import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/ColorsPallete/ColorsPallete.dart';

class SingleSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged; // +added
  SingleSelectChip(
      this.reportList,
      {required this.onSelectionChanged} // +added
      );
  @override
  _SingleSelectChipState createState() => _SingleSelectChipState();
}
class _SingleSelectChipState extends State<SingleSelectChip> {
  // String selectedChoice = "";
  List<String> selectedChoices = [];
  _buildChoiceList() {
    List<Widget> choices = [];
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          backgroundColor: navBarClr,
          selectedColor: greenClr,
          labelStyle: TextStyle(
              color: Colors.white
          ),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.clear();
              selectedChoices.add(item);
              // selectedChoices.contains(item)
              //     ? selectedChoices.remove(item)
              //     : selectedChoices.add(item);
              widget.onSelectionChanged(selectedChoices); // +added
            });
          },
        ),
      ));
    });
    return choices;
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Wrap(
        children: _buildChoiceList(),
      ),
    );
  }
}