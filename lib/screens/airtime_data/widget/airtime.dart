import 'package:baxify/const/color_constants.dart';
import 'package:baxify/const/path_constants.dart';
import 'package:baxify/screens/common_widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';

class AirtimeWidget extends StatefulWidget {
  const AirtimeWidget({Key? key}) : super(key: key);

  @override
  State<AirtimeWidget> createState() => _AirtimeWidgetState();
}

class _AirtimeWidgetState extends State<AirtimeWidget> {
  int _value = 0;
  late TextEditingController _amount;
  late TextEditingController _phonenumber;

  List<Widget> amount = [];

  String _verticalGroupValue = "To my Number";

  final List<String> _status = [
    "To my Number",
    "To new number",
  ];

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
          const Text("Amount"),
          TextField(
            controller: _amount,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Enter the Value',
            ),
          ),
          Card(
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
              }),
              items: _status,
              itemBuilder: (item) => RadioButtonBuilder(
                item,
              ),
            ),
          ),
          Card(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("TO"), Text("07067058995")]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Beneficiary Number"),
                  MyTextField2(
                      placeholder: "Enter Phone number",
                      controller: _phonenumber,
                      onTextChanged: () {},
                      errorText: "",
                      myLabel: "")
                ]),
          ),
        ],
      ),
    );
  }
}
