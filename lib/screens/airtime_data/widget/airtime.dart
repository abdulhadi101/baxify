import 'package:baxify/const/color_constants.dart';
import 'package:baxify/const/path_constants.dart';
import 'package:baxify/const/style_constants.dart';
import 'package:baxify/screens/common_widgets/my_button.dart';
import 'package:baxify/screens/common_widgets/my_text_field.dart';
import 'package:baxify/services/api/api_service.dart';
import 'package:baxify/utility/random_generator.dart';
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

  bool tomyNumber = true;

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
    print(_value);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            ],
          ),
          TextField(
            showCursor: true,
            style: headingTextStyle1,
            controller: _amount,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Amount',
              labelStyle: TextStyle(fontSize: 24),
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
              title: "Buy Airtime",
              onTap: () {
                String service_type;
                String agentId;

                if (_value == 0) {
                  buyAirtime(
                    service_type: "mtn",
                  );
                } else if (_value == 1) {
                  buyAirtime(
                    service_type: "glo",
                  );
                } else if (_value == 2) {
                  buyAirtime(
                    service_type: "airtel",
                  );
                } else if (_value == 3) {
                  buyAirtime(
                    service_type: "9mobile",
                  );
                } else {
                  buyAirtime(
                    service_type: "",
                  );
                }
              }),
        ],
      ),
    );
  }

  void buyAirtime({
    required String service_type,
  }) {
    String phonenumber;
    if (tomyNumber) {
      phonenumber = '';
    } else {
      phonenumber = _phonenumber.text;
    }

    var response = ApiService(queryparam: {
      'phone': _phonenumber.text,
      'amount': _amount.text,
      'service_type': service_type,
      'plan': 'prepaid',
      'agentId': '207',
      'agentReference': RandomStringGenerator.getBase64RandomString(16),
    }).buyAirtime();
  }
}
