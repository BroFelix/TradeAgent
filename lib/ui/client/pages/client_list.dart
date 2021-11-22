import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trade_agent/data/model/client.dart';
import 'package:trade_agent/theme/style.dart';
import 'package:trade_agent/ui/client/components/client_card.dart';
import 'package:trade_agent/ui/client/pages/client_page.dart';


class CounterAgentListPage extends StatefulWidget {
  const CounterAgentListPage({Key? key}) : super(key: key);

  @override
  _CounterAgentListState createState() => _CounterAgentListState();
}

class _CounterAgentListState extends State<CounterAgentListPage> {
  @override
  Widget build(BuildContext context) {
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
        child: ListView.builder(
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
              phoneNumber: '+998 90 6024795',
              debt: true,
            ),
          ),
        ),
      ),
    );
  }
}
