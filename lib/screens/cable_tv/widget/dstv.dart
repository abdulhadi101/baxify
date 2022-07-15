import 'package:baxify/const/color_constants.dart';
import 'package:baxify/const/path_constants.dart';
import 'package:baxify/const/style_constants.dart';
import 'package:baxify/helpers/loading/loading_screen.dart';
import 'package:baxify/screens/common_widgets/my_button.dart';
import 'package:baxify/screens/common_widgets/my_text_field.dart';
import 'package:baxify/services/api/api_service.dart';
import 'package:baxify/services/auth/auth_service.dart';
import 'package:baxify/utility/dialogs/error_dialog.dart';
import 'package:baxify/utility/dialogs/success_dialog.dart';
import 'package:baxify/utility/random_generator.dart';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';

class DSTV extends StatefulWidget {
  const DSTV({Key? key}) : super(key: key);

  @override
  State<DSTV> createState() => _DSTVState();
}

class _DSTVState extends State<DSTV> {
  int _value = 0;
  String? currentUserNumber = AuthService.firebase().currentUserPhonenumber;
  late TextEditingController _amount;
  late TextEditingController _phonenumber;

  late String customerName = "";

  String amount = " ";

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
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text("Select A DSTV Package"),
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
                  child: Image.asset(PathConstants.premium),
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
                  child: Image.asset(PathConstants.compact),
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
                  child: Image.asset(PathConstants.family),
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
                  child: Image.asset(PathConstants.access),
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
                  child: Image.asset(PathConstants.compactplus),
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
              labelText: 'Smart Card Number',
              labelStyle: TextStyle(fontSize: 24),
            ),
          ),
          ListTile(
            leading: Text(customerName),
            trailing: TextButton(
                child: Text("Validate"),
                onPressed: () {
                  _getCurrentUserName();
                }),
          ),
          Container(
              child: Card(
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: const Text("Amount"),
                  trailing: Text(amount),
                )),
          )),
          MyButton(
              title: "Pay DSTV Subscription",
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());

                LoadingScreen()
                    .show(context: context, text: "Please wait a moment");

                if (_value == 0) {
                  buyAirtime(
                    serviceType: "mtn",
                  );
                } else if (_value == 1) {
                  buyAirtime(
                    serviceType: "glo",
                  );
                } else if (_value == 2) {
                  buyAirtime(
                    serviceType: "airtel",
                  );
                } else if (_value == 3) {
                  buyAirtime(
                    serviceType: "9mobile",
                  );
                } else {
                  buyAirtime(
                    serviceType: "",
                  );
                }
              }),
        ],
      ),
    );
  }

// ignore: todo
//TODO: Refecator this and use Bloc State Management
  void buyAirtime({
    required String serviceType,
  }) async {
    var response = ApiService(queryparam: {
      'phone': '',
      'amount': _amount.text,
      'service_type': serviceType,
      'plan': 'prepaid',
      'agentId': '207',
      'agentReference': RandomStringGenerator.getBase64RandomString(16),
    }).buyAirtime();
    var statuscode = await response.then((value) => value?.code);
    var message =
        await response.then((value) => value?.data.transactionMessage);

    print(message);
    print(statuscode.toString());

    if (statuscode == 200) {
      LoadingScreen().hide();
      _amount.dispose();
      if (!mounted) return;
      await showSuccessDialog(context, message!);
    } else {
      LoadingScreen().hide();
      if (!mounted) return;
      await showErrorDialog(context, "Something went wrong");
    }
  }

  void _getCurrentUserName() {}
}
