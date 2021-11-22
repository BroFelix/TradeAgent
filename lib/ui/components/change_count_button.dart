import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChangeCountButton extends StatelessWidget {
  final void Function() onPressed;
  final double value;
  final bool isSubstract;
  var formatter = NumberFormat("####.#");

  ChangeCountButton({required this.onPressed, required this.value, this.isSubstract = false});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.grey,
      textColor: Colors.white,
      minWidth: 48.0,
      onPressed: onPressed,
      child: Text("${(isSubstract ? '-' : '+')}${formatter.format(value)}"),
    );
  }
}
