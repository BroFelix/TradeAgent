import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trade_agent/theme/style.dart';

class ClientCard extends StatelessWidget {
  const ClientCard({
    Key? key,
    required this.fullName,
    required this.address,
    required this.phoneNumber,
    required this.debt,
  }) : super(key: key);

  final String fullName;
  final String address;
  final String phoneNumber;
  final bool debt;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Ф.И.О.:',
                  style: AppTextStyles.cardTextStyle,
                ),
                const SizedBox(width: 24.0),
                Text(
                  fullName,
                  style: AppTextStyles.cardTextStyle,
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Адрес:',
                  style: AppTextStyles.cardTextStyle,
                ),
                const SizedBox(width: 24.0),
                Text(
                  address,
                  style: AppTextStyles.cardTextStyle,
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Тел.Номер:',
                  style: AppTextStyles.cardTextStyle,
                ),
                const SizedBox(width: 24.0),
                Text(
                  phoneNumber,
                  style: AppTextStyles.cardTextStyle,
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Долги:',
                  style: AppTextStyles.cardTextStyle,
                ),
                const SizedBox(width: 24.0),
                Text(
                  debt ? 'Есть' : '-',
                  style: AppTextStyles.cardTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
