import 'package:flutter/material.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  List todos;

  @override
  void initState() {
    todos = ["Comprar cafe"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
      floatingActionButton: _floatingActionButton(context),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Text("Todo"),
      backgroundColor: Colors.deepPurple,
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      color: Colors.white54,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        padding: EdgeInsets.only(bottom: 72),
        children: todos.map<Widget>((item) {
          return Column(
            children: <Widget>[
              ListTile(
                title: Text("$item"),
                onTap: () {
                  print(item);
                },
              ),
              Divider()
            ],
          );
        }).toList(),
      ),
    );
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _addTask(context);
        });
  }

  void _addTask(BuildContext context) async {
    var task = await _dialog(context);

    if (task == null) return;

    setState(() {
      todos.add(task);
    });
  }

  Future<String> _dialog(BuildContext context) async {
    TextEditingController _todoController = TextEditingController(text: "");

    var result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text("Novo todo"),
            content: Container(
              child: TextField(
                  controller: _todoController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.format_list_numbered),
                      hintText: "Todo",
                      hasFloatingPlaceholder: true)),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              ),
              FlatButton(
                child: Text("Salvar"),
                onPressed: () {
                  Navigator.of(ctx).pop(_todoController.text);
                },
              )
            ],
          );
        });

    return result;
  }
}
