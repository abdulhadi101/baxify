import 'package:baxify/const/color_constants.dart';
import 'package:baxify/const/path_constants.dart';
import 'package:baxify/screens/common_widgets/my_button.dart';
import 'package:baxify/screens/common_widgets/my_text_field.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';

class DataWidget extends StatefulWidget {
  const DataWidget({Key? key}) : super(key: key);

  @override
  State<DataWidget> createState() => _DataWidgetState();
}

class _DataWidgetState extends State<DataWidget> {
  String? selectedbundle;
  final List<String> _databundles = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17'
  ];
  int _value = 0;
  late TextEditingController _amount;
  late TextEditingController _phonenumber;

  List<Widget> amount = [];

  String _verticalGroupValue = "To my Number";

  final List<String> _status = [
    "To my Number",
    "To new number",
  ];
  bool tomyNumber = true;
  @override
  void dispose() {
    _amount.dispose();
    _phonenumber.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _amount = TextEditingController(text: "0");
    _phonenumber = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                onTap: () => setState(() => _value = 0),
                child: Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    border: _value == 0
                        ? Border.all(color: Colors.black)
                        : Border.all(color: Colors.transparent),
                  ),
                  //    color: _value == 0 ? Colors.grey : Colors.transparent,
                  child: Image.asset(PathConstants.mtn),
                ),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: () => setState(() => _value = 1),
                child: Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    border: _value == 1
                        ? Border.all(color: Colors.black)
                        : Border.all(color: Colors.transparent),
                  ),
                  child: Image.asset(PathConstants.glo),
                ),
              ),
              GestureDetector(
                onTap: () => setState(() => _value = 2),
                child: Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    border: _value == 2
                        ? Border.all(color: Colors.black)
                        : Border.all(color: Colors.transparent),
                  ),
                  child: Image.asset(PathConstants.airtel),
                ),
              ),
              GestureDetector(
                onTap: () => setState(() => _value = 3),
                child: Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    border: _value == 3
                        ? Border.all(color: Colors.black)
                        : Border.all(color: Colors.transparent),
                  ),
                  child: Image.asset(PathConstants.etisalat),
                ),
              ),
              GestureDetector(
                onTap: () => setState(() => _value = 4),
                child: Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    border: _value == 4
                        ? Border.all(color: Colors.black)
                        : Border.all(color: Colors.transparent),
                  ),
                  child: Image.asset(PathConstants.smile),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: Row(
                  children: const [
                    Text(
                      'CHOOSE DATA BUNDLE',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                items: _databundles
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: selectedbundle,
                onChanged: (value) {
                  setState(() {
                    selectedbundle = value as String;
                  });
                },
                icon: const Icon(
                  Icons.arrow_drop_down_outlined,
                ),
                iconSize: 24,
                iconEnabledColor: Colors.black,
                iconDisabledColor: Colors.grey,
                buttonHeight: 50,
                //buttonWidth: 160,
                buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                buttonDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                buttonElevation: 2,
                itemHeight: 40,
                itemPadding: const EdgeInsets.only(left: 14, right: 14),
                dropdownMaxHeight: 200,
                //  dropdownWidth: 200,
                dropdownPadding: null,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.white,
                ),
                dropdownElevation: 8,
                scrollbarRadius: const Radius.circular(0),
                scrollbarThickness: 6,
                scrollbarAlwaysShow: true,
                offset: const Offset(0, 0),
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RadioGroup<String>.builder(
                spacebetween: 0,
                horizontalAlignment: MainAxisAlignment.spaceAround,
                activeColor: ColorConstants.primaryColor,
                direction: Axis.horizontal,
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold),
                groupValue: _verticalGroupValue,
                onChanged: (value) => setState(() {
                  _verticalGroupValue = value!;
                  tomyNumber = !tomyNumber;
                }),
                items: _status,
                itemBuilder: (item) => RadioButtonBuilder(
                  item,
                ),
              ),
            ),
          ),
          Container(
            child: tomyNumber
                ? const Card(
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          leading: Text("TO"),
                          trailing: Text("07067058995"),
                        )),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        MyTextField2(
                            placeholder: "Enter Phone number",
                            controller: _phonenumber,
                            onTextChanged: () {},
                            errorText: "",
                            myLabel: "Beneficiary Number")
                      ]),
          ),
          MyButton(
              title: "Buy Data Bundle",
              onTap: () {
                if (kDebugMode) {
                  print("object");
                }
              }),
        ],
      ),
    );
  }
}
