import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_agent/data/model/client.dart';

import 'client_picker.dart';

class ClientBar extends StatefulWidget {
  final Client client;
  final void Function(Client client) onChanged;
  final bool edit;

  const ClientBar({
    Key? key,
    required this.client,
    required this.onChanged,
    required this.edit,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ClientBarState();
}

class _ClientBarState extends State<ClientBar> {
  List<Client> clients = [];
  late Client client;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.edit
          ? () {
              showDialog(
                  context: context,
                  builder: (context) => ClientDialog(
                        clients: clients,
                        onClientSelected: (selectedClient) {
                          if (mounted) {
                            setState(() {
                              client = selectedClient;
                              widget.onChanged(selectedClient);
                            });
                          }
                        },
                      ));
            }
          : null,
      child: Container(
        height: 84.sh,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            border: Border.all(color: Colors.black45, width: 2.0, style: BorderStyle.solid)),
        child: Row(
          children: <Widget>[
            const Flexible(
              flex: 1,
              child: Icon(Icons.person),
            ),
            SizedBox(width: 24.sh),
            Text(
              client != null ? client.fullName : "Не выбрано",
              style: TextStyle(
                fontSize: 24.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
