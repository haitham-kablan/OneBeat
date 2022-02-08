import 'package:flutter/material.dart';
import 'package:onebeat_darkmode/Design/ColorsPallete/Pallete.dart';


class ChoiceChipDisplay extends StatefulWidget {

  final onSelected;

  const ChoiceChipDisplay({Key? key, required this.onSelected}) : super(key: key);
  @override
  _ChoiceChipDisplayState createState() => _ChoiceChipDisplayState(this.onSelected);
}

class _ChoiceChipDisplayState extends State<ChoiceChipDisplay> {
  final onSelected;
  List<String> chipList = [
    "רגליים",
    "בטן",
    "כתפיים",
    "חזה",
    "גב",
    "יד קדמית",
    "יד אחורית",
  ];

  _ChoiceChipDisplayState(this.onSelected);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
          child: Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: <Widget>[
              choiceChipWidget(chipList,onSelected),
            ],
          )),
    );
  }
}

class choiceChipWidget extends StatefulWidget {
  final List<String> reportList;
  final onSelected;

  choiceChipWidget(this.reportList, this.onSelected);

  @override
  _choiceChipWidgetState createState() => new _choiceChipWidgetState(this.onSelected);
}

class _choiceChipWidgetState extends State<choiceChipWidget> {
  String selectedChoice = "";
  final onSelected;

  _choiceChipWidgetState(this.onSelected);

  _buildChoiceList() {
    List<Widget> choices = [];
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          labelStyle: TextStyle(
              color: selectedChoice == item ? Colors.white : Colors.grey[600]!, fontSize: 14.0, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          backgroundColor: backGroundClr,
          selectedColor: greenClr,
          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
              onSelected(selectedChoice);
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}