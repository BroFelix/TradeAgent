import 'package:flutter/material.dart';
import 'package:trade_agent/data/model/client.dart';
import 'package:trade_agent/data/model/product.dart';
import 'package:trade_agent/theme/style.dart';
import 'package:trade_agent/ui/components/change_count_dialog.dart';
import 'package:trade_agent/ui/components/client_search.dart';
import 'package:trade_agent/ui/components/product_search.dart';

class NewOrderPage extends StatefulWidget {
  NewOrderPage({
    Key? key,
    required this.client,
  }) : super(key: key);

  Client? client;

  @override
  _NewOrderPageState createState() => _NewOrderPageState();
}

class _NewOrderPageState extends State<NewOrderPage> {
  // List<CartProduct> cart = [];

  var subtotal = 0.0;
  var discount = 0.0;
  var total = 0.0;

  // Client client;
  // int activeShift;
  // Payment payment = Payment();
  // var formatter = NumberFormat("####.#");
  // var dateFormatter = DateFormat("yyyy-MM-dd HH-mm");
  // AppDatabase db;
  String barcode = "";

  List<Product> products = [];

  @override
  Widget build(BuildContext context) {
    void calculateTotal() {
      var subtotal = 0.0;
      // cart.forEach((product) {
      //   subtotal += product.count * product.sellprice;
      //   setState(() {
      //     product.total = product.count * product.sellprice;
      //   });
      // });
      setState(() {
        subtotal = subtotal;
        total = subtotal * (1 - discount / 100);
      });
    }

    void _changeCount(index) {
      showDialog(
        context: context,
        builder: (context) => ChangeCountDialog(
          // product: cart[index],
          onChanged: (newCount) {
            setState(() {
              // cart[index].count = newCount;
              // cart[index].pieces = newCount;
              // cart[index].packages = 0;
            });
            calculateTotal();
          },
        ),
      );
    }

    void _openClientPickDialog() {
      Navigator.of(context).push(
        MaterialPageRoute<void>(builder: (context) => ClientSearchPage()),
      );
    }

    void _openProductPickDialog() {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (context) => ProductSearchPage(
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
          ),
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
        title: const Text('Новая заявка'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              readOnly: true,
              onTap: () => _openClientPickDialog(),
              decoration: InputDecoration(
                hintText: widget.client != null ? widget.client!.fullName : 'Контр Агенты',
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
                color: Colors.grey[300],
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
              'Добавить Заявку',
              style: AppTextStyles.buttonTextStyle.copyWith(color: Colors.white),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
