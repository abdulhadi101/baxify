import 'package:flutter/material.dart';
import 'package:baxify/utility/dialogs/generic_dialog.dart';

Future<void> showSuccessDialog(
  BuildContext context,
  String text,
) {
  return showGenericDialog(
      context: context,
      title: "Success",
      content: text,
      optionBuilder: () {
        return {
          'OK': null,
        };
      });
}
