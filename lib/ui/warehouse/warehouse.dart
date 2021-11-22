import 'package:flutter/material.dart';

class WarehousePage extends StatefulWidget {
  const WarehousePage({Key? key}) : super(key: key);

  @override
  _WarehousePageState createState() => _WarehousePageState();
}

class _WarehousePageState extends State<WarehousePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Склад'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Поиск по наименованию',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    width: 1.0,
                    color: Colors.black,
                  ),
                ),
                child: DataTable(
                  headingRowHeight: 32.0,
                  // columnSpacing: 84.0,
                  // horizontalMargin: 24.0,
                  columns: const [
                    DataColumn(
                      label: Text('№'),
                    ),
                    DataColumn(
                      label: Text('Продукт'),
                    ),
                    DataColumn(
                      label: Text('Количество'),
                    ),
                  ],
                  rows: const [
                    DataRow(
                      cells: [
                        DataCell(
                          Text('12'),
                        ),
                        DataCell(
                          Text('Baxt'),
                        ),
                        DataCell(
                          Text('123/100gr'),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text('12'),
                        ),
                        DataCell(
                          Text('Baxt'),
                        ),
                        DataCell(
                          Text('123/100gr'),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text('12'),
                        ),
                        DataCell(
                          Text('Baxt'),
                        ),
                        DataCell(
                          Text('123/100gr'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
