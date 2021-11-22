import 'package:flutter/material.dart';

class ClientSearchPage extends StatefulWidget {
  const ClientSearchPage({
    Key? key,
    required this.onSelect,
  }) : super(key: key);

  final void Function(int) onSelect;

  @override
  _ClientSearchPageState createState() => _ClientSearchPageState();
}

class _ClientSearchPageState extends State<ClientSearchPage> {
  List products = [];
  String filter = "";

  @override
  Widget build(BuildContext context) {
    bool _filterItem(index) {
      return products[index].title.toLowerCase().contains(filter.toLowerCase());
    }

    Widget _getListItem(index) {
      return ListTile(
        onTap: () {
          widget.onSelect(products[index]);
          Navigator.of(context).pop();
        },
        leading: const Icon(Icons.person),
        title: Text("${products[index].title}"),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(4.0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                filter = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Поиск контр агента',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: const BorderSide(color: Colors.white, width: 1.0),
              ),
              suffixIcon: const Icon(Icons.search),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return filter == null || filter == ''
              ? _getListItem(index)
              : _filterItem(index)
                  ? _getListItem(index)
                  : Container();
        },
      ),
    );
  }
}
