import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trade_agent/data/model/client.dart';
import 'package:trade_agent/theme/style.dart';
import 'package:trade_agent/ui/components/client_card.dart';
import 'package:trade_agent/ui/client/pages/client_page.dart';

class ClientListPage extends StatefulWidget {
  const ClientListPage({Key? key}) : super(key: key);

  @override
  _ClientListState createState() => _ClientListState();
}

class _ClientListState extends State<ClientListPage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Контр Агенты',
          style: AppTextStyles.appBarTitleTextStyle,
        ),
      ),
      body: Padding(
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
            const SizedBox(height: 12.0),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                width: mediaQuery.size.width,
                height: mediaQuery.size.height * 0.6,
              ),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 3,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ClientPage(
                          client: Client(
                            id: 0,
                            fullName: "FullName",
                            address: "Address",
                            phoneNumber: "+998906024795",
                            debt: true,
                          ),
                        ),
                      ),
                    );
                  },
                  child: const ClientCard(
                    fullName: 'Felix',
                    address: 'Sattepo',
                    phoneNumber: '+998906024795',
                    debt: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
