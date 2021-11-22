import 'package:flutter/material.dart';
import 'package:trade_agent/data/model/client.dart';

class ClientDialog extends StatefulWidget {
  final List<Client> clients;
  final void Function(Client client) onClientSelected;

  const ClientDialog({
    Key? key,
    required this.clients,
    required this.onClientSelected,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ClientDialogState();
}

class _ClientDialogState extends State<ClientDialog> {
  var searchText = "";

  Widget getContent() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.search),
                hintText: 'Поиск клиента',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(width: 1.0, color: Colors.black26)),
              ),
              onChanged: (val) {
                setState(() {
                  searchText = val;
                });
              },
            ),
          ),
          Expanded(
            child: buildList(widget.clients),
          ),
        ],
      ),
    );
  }

  bool filterClient(index) {
    return widget.clients[index].fullName.toLowerCase().contains(searchText);
  }

  Widget _getClientListItem(clients, index) {
    return ListTile(
      onTap: () {
        widget.onClientSelected(clients[index]);
        Navigator.of(context).pop();
      },
      leading: const Icon(Icons.person),
      title: Text("${clients[index].fullname}"),
    );
  }

  Widget buildList(clients) {
    return ListView.builder(
      itemCount: clients.length,
      itemBuilder: (BuildContext context, int index) {
        return searchText == null || searchText == ''
            ? _getClientListItem(clients, index)
            : filterClient(index)
                ? _getClientListItem(clients, index)
                : Container();
      },
    );
  }

  @override
  void initState() {
    // bloc.fetchAllClients();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: getContent(),
    );
  }
}
