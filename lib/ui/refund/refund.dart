import 'package:flutter/material.dart';
import 'package:trade_agent/theme/style.dart';
import 'package:trade_agent/ui/components/product_search.dart';

class RefundPage extends StatefulWidget {
  const RefundPage({Key? key}) : super(key: key);

  @override
  _RefundPageState createState() => _RefundPageState();
}

class _RefundPageState extends State<RefundPage> {
  var total = 0.0;

  @override
  Widget build(BuildContext context) {
    void _openProductPickDialog() {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return ProductSearchPage(
              onSelect: (value) {},
              // onSelect: (Product product) {
              //   var pr = CartProduct.fromJson(product.toJson());
              //   int index = cart.indexWhere((element) {
              //     return element.id == pr.id;
              //   });
              //   print(index);
              //   if (index >= 0) {
              //     setState(() {
              //       cart[index].count += 1;
              //     });
              //   } else {
              //     pr.count = 1;
              //     pr.total = pr.count * pr.sellprice;
              //     setState(() {
              //       cart.add(pr);
              //     });
              //   }
              //   calculateTotal();
              // },
            );
          },
          fullscreenDialog: true,
        ),
      );
    }

    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        titleTextStyle: AppTextStyles.appBarTitleTextStyle,
        title: const Text('Возврат'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              readOnly: true,
              onTap: () {
                _openProductPickDialog();
              },
              decoration: InputDecoration(
                hintText: 'Контр Агенты',
                hintStyle: AppTextStyles.infoTextStyle.copyWith(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              alignment: Alignment.centerRight,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                color: Colors.white,
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                onPressed: () => _openProductPickDialog(),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: Colors.black, width: 2.0),
              ),
              child: DataTable(
                headingRowHeight: 24,
                horizontalMargin: 0,
                columnSpacing: 24.0,
                columns: const [
                  DataColumn(
                    label: Text('Название'),
                  ),
                  DataColumn(
                    label: Text('Количество'),
                  ),
                  DataColumn(
                    label: Text('Вес'),
                  ),
                  DataColumn(
                    label: Text('Цена'),
                  ),
                ],
                rows: const [
                  DataRow(
                    cells: [
                      DataCell(
                        Text('Kolbasa Baxt'),
                      ),
                      DataCell(
                        Text('23/100gr'),
                      ),
                      DataCell(
                        Text('22300kg'),
                      ),
                      DataCell(
                        Text('24.000'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Общая стоимость:',
                style: AppTextStyles.infoTextStyle.copyWith(fontWeight: FontWeight.w500),
              ),
              Text(
                total.toString(),
                style: AppTextStyles.infoTextStyle.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: MaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            color: Colors.blueAccent,
            height: mediaQuery.size.height * 0.075,
            minWidth: mediaQuery.size.width,
            child: Text(
              'Добавить Возрат',
              style: AppTextStyles.buttonTextStyle.copyWith(color: Colors.white),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
