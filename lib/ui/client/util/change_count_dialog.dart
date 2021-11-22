import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import 'change_count_button.dart';

class ChangeCountDialog extends StatelessWidget {
  // final CartProduct product;

  final void Function(double discount) onChanged;

  ChangeCountDialog({
    // this.product,
    required this.onChanged,
  });

  var formatter = NumberFormat("####.#");

  @override
  Widget build(BuildContext context) {
    // double count = product.count;

    var _countController = TextEditingController();
    // _countController.text = formatter.format(product.count);

    void changeCount(value) {
      // count += value;
      // count = double.parse(count.toStringAsFixed(2));
      // _countController.text = formatter.format(count);
    }

    return Dialog(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.teal,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ]),
        height: 300,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                ChangeCountButton(
                  value: 0.1,
                  onPressed: () {
                    changeCount(0.1);
                  },
                ),
                ChangeCountButton(
                  value: 0.5,
                  onPressed: () {
                    changeCount(0.5);
                  },
                ),
                ChangeCountButton(
                    value: 1,
                    onPressed: () {
                      changeCount(1);
                    }),
                ChangeCountButton(
                    value: 5,
                    onPressed: () {
                      changeCount(5);
                    }),
                ChangeCountButton(
                    value: 10,
                    onPressed: () {
                      changeCount(10);
                    }),
              ]),
            ),
            TextFormField(
              controller: _countController,
              onTap: () {
                _countController.selection = TextSelection(baseOffset: 0, extentOffset: _countController.text.length);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2.0, color: Colors.black, style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.0, color: Colors.white, style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.0, color: Colors.black, style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                hintStyle: TextStyle(color: Colors.black45),
                hintText: 'Кол-во',
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.number,
              onChanged: (val) {
                // count = double.parse(val);
              },
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (val) {
                // count = double.parse(val);
                // onChanged(count);
                Navigator.of(context).pop();
              },
            ),
            SingleChildScrollView(
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                ChangeCountButton(
                  value: 0.1,
                  isSubstract: true,
                  onPressed: () {
                    changeCount(-0.1);
                  },
                ),
                ChangeCountButton(
                  value: 0.5,
                  isSubstract: true,
                  onPressed: () {
                    changeCount(-0.5);
                  },
                ),
                ChangeCountButton(
                  value: 1,
                  isSubstract: true,
                  onPressed: () {
                    changeCount(-1);
                  },
                ),
                ChangeCountButton(
                  value: 5,
                  isSubstract: true,
                  onPressed: () {
                    changeCount(-5);
                  },
                ),
                ChangeCountButton(
                  value: 10,
                  isSubstract: true,
                  onPressed: () {
                    changeCount(-10);
                  },
                ),
              ]),
              scrollDirection: Axis.horizontal,
            ),
            const SizedBox(height: 24),
            MaterialButton(
              color: Colors.white,
              textColor: Colors.black,
              padding: const EdgeInsets.all(16),
              child: const Text('Подтвердить'),
              onPressed: () {
                // onChanged(count);
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
