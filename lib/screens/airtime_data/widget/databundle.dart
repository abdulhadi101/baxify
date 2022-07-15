import 'package:baxify/const/color_constants.dart';
import 'package:baxify/const/path_constants.dart';
import 'package:baxify/helpers/loading/loading_screen.dart';
import 'package:baxify/models/databundle_model.dart';
import 'package:baxify/screens/common_widgets/my_button.dart';
import 'package:baxify/screens/common_widgets/my_text_field.dart';
import 'package:baxify/services/api/api_service.dart';
import 'package:baxify/services/auth/auth_service.dart';
import 'package:baxify/utility/dialogs/error_dialog.dart';
import 'package:baxify/utility/dialogs/infotmation_dialog.dart';
import 'package:baxify/utility/dialogs/success_dialog.dart';
import 'package:baxify/utility/notification.dart';
import 'package:baxify/utility/random_generator.dart';
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
  String? selectedDatacode;
  String? selectedBundleAmount = '1000';
  final List<ListTile> _databundles = [
    ListTile(
      leading: Text(
        "1.5GB 1-Month Mobile for Monthly",
        style: TextStyle(color: ColorConstants.textBlack),
      ),
    ),
  ];
  int _value = 0;
  String? currentUserNumber = AuthService.firebase().currentUserPhonenumber;
  late TextEditingController _amount;
  late TextEditingController _phonenumber;

  List<Widget> amount = [];
  late var data_bundle_response;
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
                onTap: () => setState(
                  () {
                    showInfoDialog(context, "Not currently available");
                    _value = 0;
                  },
                ),
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
                onTap: () => setState(() {
                  showInfoDialog(context, "Not currently available");
                  _value = 0;
                }),
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
                onTap: () => setState(() {
                  showInfoDialog(context, "Not currently available");
                  _value = 0;
                }),
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
                onTap: () => setState(() {
                  showInfoDialog(context, "Not currently available");
                  _value = 0;
                }),
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
          newMethod(),
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
                ? Card(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          leading: Text("TO"),
                          trailing: Text(currentUserNumber!),
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
                          myLabel: "Beneficiary Number"),
                    ],
                  ),
          ),
          MyButton(
              title: "Buy Data Bundle",
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());

                LoadingScreen()
                    .show(context: context, text: "Please wait a moment");

                if (_value == 0) {
                  buyData(
                    serviceType: "mtn",
                  );
                } else if (_value == 1) {
                  showInfoDialog(context, "Not currently available");
                } else if (_value == 2) {
                  showInfoDialog(context, "Not currently available");
                } else if (_value == 3) {
                  showInfoDialog(context, "Not currently available");
                } else {
                  showInfoDialog(context, "Not currently available");
                }
              }),
        ],
      ),
    );
  }

  Padding newMethod() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: DropdownButtonHideUnderline(
          child: DropdownButton2(
        isExpanded: true,
        hint: Row(
          children: const [
            Text(
              '1.5GB 1-Month Mobile for Monthly',
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
            .map((item) => DropdownMenuItem<ListTile>(
                onTap: () {
                  showErrorDialog(context,
                      "You will be able to choose a plan in the next update");
                },
                value: item,
                child: ListTile()))
            .toList(),
        value: selectedDatacode,
        onChanged: (value) {
          setState(() {
            selectedDatacode = value.toString() as String;
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
      )),
    );
  }

  void buyData({required String serviceType}) async {
    String phonenumber;
    if (tomyNumber) {
      phonenumber = currentUserNumber!;
    } else {
      phonenumber = _phonenumber.text;
    }

    var response = ApiService(queryparam: {
      'phone': phonenumber,
      'amount': selectedBundleAmount,
      'service_type': serviceType,
      'datacode': '1000',
      'agentId': '207',
      'agentReference': RandomStringGenerator.getBase64RandomString(16),
    }).buyData();
    var statuscode = await response.then((value) => value?.code);
    var message =
        await response.then((value) => value?.data.transactionMessage);

    print(message);
    print(statuscode.toString());

    if (statuscode == 200) {
      LoadingScreen().hide();
      MyNotification().Notify();
      if (!mounted) return;
      await showSuccessDialog(context, message!);
    } else {
      LoadingScreen().hide();
      if (!mounted) return;
      await showErrorDialog(context, "Something went wrong");
    }
  }

  void getDataBundles({
    required String serviceType,
  }) async {
    data_bundle_response = ApiService(
      queryparam: {
        'service_type': serviceType,
      },
    ).getDataBundles();

    var statuscode = await data_bundle_response.then((value) => value?.code);
    print(statuscode.toString());
  }

  Future<DataBundle?> _getDataBundle() async {
    if (_value == 0) {
      getDataBundles(
        serviceType: "mtn",
      );
    } else if (_value == 1) {
      getDataBundles(
        serviceType: "glo",
      );
    } else if (_value == 2) {
      getDataBundles(
        serviceType: "airtel",
      );
    } else if (_value == 3) {
      getDataBundles(
        serviceType: "9mobile",
      );
    } else {
      getDataBundles(
        serviceType: "smile",
      );
    }
    var json;
    if (data_bundle_response.statusCode == 200) {
      json = data_bundle_response.body;
      print(json);
      return dataBundleFromJson(json);
    } else {
      var json = data_bundle_response.body;
      print(json);
    }

    return dataBundleFromJson(json);
  }
}
