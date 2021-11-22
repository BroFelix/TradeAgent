import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trade_agent/data/model/client.dart';
import 'package:trade_agent/theme/color.dart';
import 'package:trade_agent/theme/style.dart';
import 'package:trade_agent/ui/components/radio_box.dart';
import 'package:trade_agent/ui/order/new_order.dart';
import 'package:trade_agent/ui/refund/refund.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({
    Key? key,
    required this.client,
  }) : super(key: key);

  final Client client;

  @override
  _ClientPageState createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  bool debt = true;
  bool paymentType = false;
  bool userType = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Контр Агент №${widget.client.id}'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Ф.И.О.:',
                      style: AppTextStyles.infoTextStyle,
                    ),
                    const SizedBox(width: 12.0),
                    Text(
                      widget.client.fullName,
                      style: AppTextStyles.infoTextStyle,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Адрес:',
                      style: AppTextStyles.infoTextStyle,
                    ),
                    const SizedBox(width: 12.0),
                    Text(
                      widget.client.address,
                      style: AppTextStyles.infoTextStyle,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Номер телефона:',
                      style: AppTextStyles.infoTextStyle,
                    ),
                    const SizedBox(width: 12.0),
                    Text(
                      widget.client.phoneNumber,
                      style: AppTextStyles.infoTextStyle,
                    )
                  ],
                ),
                const SizedBox(height: 48),
                if (userType) ...[
                  const Text(
                    'Заявки для доставок:',
                    style: AppTextStyles.infoTextStyle,
                  ),
                  DataTable(
                      horizontalMargin: 8.0,
                      columnSpacing: 32.0,
                      dataTextStyle: AppTextStyles.dataTableTextStyle,
                      columns: const [
                        DataColumn(
                          label: Text(
                            'Дата',
                            style: AppTextStyles.dataTableHeaderTextStyle,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Сумма',
                            style: AppTextStyles.dataTableHeaderTextStyle,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Статус',
                            style: AppTextStyles.dataTableHeaderTextStyle,
                          ),
                        ),
                      ],
                      rows: [
                        DataRow(cells: [
                          const DataCell(
                            Text(
                              '11.10.2021',
                              style: AppTextStyles.dataTableTextStyle,
                            ),
                          ),
                          const DataCell(
                            Text(
                              '-50.000',
                              style: AppTextStyles.dataTableTextStyle,
                            ),
                          ),
                          DataCell(
                            Center(
                              child: widget.client.debt
                                  ? MaterialButton(
                                      height: 32,
                                      minWidth: 64,
                                      color: AppColors.primaryColor,
                                      child: const Icon(
                                        Icons.attach_money,
                                        color: Colors.white,
                                      ),
                                      onPressed: () => showDialog(
                                        context: context,
                                        builder: (context) => StatefulBuilder(
                                          builder: (context, setState) => _buildDialog(mediaQuery, setState, context),
                                        ),
                                      ),
                                    )
                                  : const Text(
                                      'Оплачено',
                                      style: AppTextStyles.dataTableTextStyle,
                                    ),
                            ),
                          ),
                        ]),
                        DataRow(cells: [
                          const DataCell(
                            Text(
                              '11.10.2021',
                              style: AppTextStyles.dataTableTextStyle,
                            ),
                          ),
                          const DataCell(
                            Text(
                              '-50.000',
                              style: AppTextStyles.dataTableTextStyle,
                            ),
                          ),
                          DataCell(
                            Text(
                              'Оплачено',
                              style: AppTextStyles.dataTableTextStyle.copyWith(color: Colors.red[700]),
                            ),
                          ),
                        ]),
                      ]),
                ] else ...[
                  const Text(
                    'Заявки:',
                    style: AppTextStyles.infoTextStyle,
                  ),
                  DataTable(
                      horizontalMargin: 8.0,
                      columnSpacing: 32.0,
                      dataTextStyle: AppTextStyles.dataTableTextStyle,
                      columns: const [
                        DataColumn(
                          label: Text(
                            'Дата',
                            style: AppTextStyles.dataTableHeaderTextStyle,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Сумма',
                            style: AppTextStyles.dataTableHeaderTextStyle,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Статус',
                            style: AppTextStyles.dataTableHeaderTextStyle,
                          ),
                        ),
                      ],
                      rows: [
                        DataRow(cells: [
                          const DataCell(
                            Text(
                              '11.10.2021',
                              style: AppTextStyles.dataTableTextStyle,
                            ),
                          ),
                          const DataCell(
                            Text(
                              '-50.000',
                              style: AppTextStyles.dataTableTextStyle,
                            ),
                          ),
                          DataCell(
                            Center(
                              child: widget.client.debt
                                  ? MaterialButton(
                                      height: 32,
                                      minWidth: 64,
                                      color: AppColors.primaryColor,
                                      child: const Icon(
                                        Icons.attach_money,
                                        color: Colors.white,
                                      ),
                                      onPressed: () => showDialog(
                                        context: context,
                                        builder: (context) => StatefulBuilder(
                                            builder: (context, setState) =>
                                                _buildDialog(mediaQuery, setState, context)),
                                      ),
                                    )
                                  : const Text(
                                      'Оплачено',
                                      style: AppTextStyles.dataTableTextStyle,
                                    ),
                            ),
                          ),
                        ]),
                        DataRow(cells: [
                          const DataCell(
                            Text(
                              '11.10.2021',
                              style: AppTextStyles.dataTableTextStyle,
                            ),
                          ),
                          const DataCell(
                            Text(
                              '-50.000',
                              style: AppTextStyles.dataTableTextStyle,
                            ),
                          ),
                          DataCell(
                            Text(
                              'Оплачено',
                              style: AppTextStyles.dataTableTextStyle.copyWith(
                                color: Colors.red[700],
                              ),
                            ),
                          ),
                        ]),
                      ]),
                ],
                const SizedBox(height: 48),
                const Text(
                  'Долги:',
                  style: AppTextStyles.infoTextStyle,
                ),
                DataTable(
                    horizontalMargin: 8.0,
                    columnSpacing: 32.0,
                    dataTextStyle: AppTextStyles.dataTableTextStyle,
                    columns: const [
                      DataColumn(
                        label: Text(
                          'Дата',
                          style: AppTextStyles.dataTableHeaderTextStyle,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Сумма',
                          style: AppTextStyles.dataTableHeaderTextStyle,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Статус',
                          style: AppTextStyles.dataTableHeaderTextStyle,
                        ),
                      ),
                    ],
                    rows: [
                      DataRow(cells: [
                        const DataCell(
                          Text(
                            '11.10.2021',
                            style: AppTextStyles.dataTableTextStyle,
                          ),
                        ),
                        const DataCell(
                          Text(
                            '-50.000',
                            style: AppTextStyles.dataTableTextStyle,
                          ),
                        ),
                        DataCell(
                          Center(
                            child: widget.client.debt
                                ? MaterialButton(
                                    height: 32,
                                    minWidth: 64,
                                    color: AppColors.primaryColor,
                                    child: const Icon(
                                      Icons.attach_money,
                                      color: Colors.white,
                                    ),
                                    onPressed: () => showDialog(
                                      context: context,
                                      builder: (context) => StatefulBuilder(
                                        builder: (context, setState) => _buildDialog(mediaQuery, setState, context),
                                      ),
                                    ),
                                  )
                                : const Text(
                                    'Оплачено',
                                    style: AppTextStyles.dataTableTextStyle,
                                  ),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        const DataCell(
                          Text(
                            '11.10.2021',
                            style: AppTextStyles.dataTableTextStyle,
                          ),
                        ),
                        const DataCell(
                          Text(
                            '-50.000',
                            style: AppTextStyles.dataTableTextStyle,
                          ),
                        ),
                        DataCell(
                          Text(
                            'Оплачено',
                            style: AppTextStyles.dataTableTextStyle.copyWith(
                              color: Colors.red[700],
                            ),
                          ),
                        ),
                      ]),
                    ]),
              ]),
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(
        Icons.add,
        color: AppColors.white,
      ),
      onPressed: () => userType
          ? Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewOrderPage(client: widget.client),
              ),
            )
          : Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RefundPage(),
              ),
            ),
    );
  }

  Dialog _buildDialog(MediaQueryData mediaQuery, StateSetter setState, BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: const BorderSide(color: Colors.blue, width: 2.0),
      ),
      child: SizedBox(
        height: mediaQuery.size.height * 0.4,
        width: mediaQuery.size.width * 0.7,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            Container(
              height: 48.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: Colors.blueAccent,
                  width: 2.0,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: RadioBox(
                      title: 'Без нал',
                      checked: paymentType,
                      onTap: () {
                        setState(() {
                          paymentType = true;
                        });
                      },
                      text: 'sad',
                      first: true,
                      last: false,
                    ),
                  ),
                  Expanded(
                    child: RadioBox(
                      title: 'Наличное',
                      checked: !paymentType,
                      text: 'as',
                      onTap: () {
                        setState(() {
                          paymentType = false;
                        });
                      },
                      first: false,
                      last: true,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                isDense: true,
                labelText: 'Сумма оплаты',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            const SizedBox(height: 64.0),
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              color: Colors.blueAccent,
              textColor: Colors.white,
              height: 48.0,
              minWidth: 200.0,
              child: const Text('Принят оплату'),
              onPressed: () => Navigator.pop(context),
            ),
          ]),
        ),
      ),
    );
  }
}
