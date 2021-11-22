import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trade_agent/theme/style.dart';

class RadioBox extends StatelessWidget {
  const RadioBox({
    Key? key,
    required this.title,
    required this.checked,
    required this.text,
    required this.onTap,
    this.first = false,
    this.last = false,
  }) : super(key: key);

  final String title;
  final bool checked;
  final String text;
  final VoidCallback? onTap;
  final bool first;
  final bool last;

  @override
  Widget build(BuildContext context) {
    BorderRadius getRadius() {
      if (first) {
        return const BorderRadius.horizontal(left: Radius.circular(5.0));
      }
      if (last) {
        return const BorderRadius.horizontal(right: Radius.circular(5.0));
      }

      return const BorderRadius.all(Radius.circular(5.0));
    }

    return ButtonTheme(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12.0),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: checked ? Colors.blueAccent : Colors.white,
            borderRadius: getRadius(),
          ),
          child: Center(
            child: Text(
              title,
              style: AppTextStyles.radioButtonTextStyle.copyWith(
                color: checked ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
