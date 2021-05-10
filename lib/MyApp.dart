import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'transaction.dart';

//You can define your own Widget
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

//This is a "very basic" statefulwidget
class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _contentController = TextEditingController();
  final _amountController = TextEditingController();

  //define states
  String _content;
  double _amount;
  Transaction _transaction = Transaction('', 0.0);

  List<Transaction> _transactions = <Transaction>[];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "This is a StatefulWidget",
        home: Scaffold(
            key: _scaffoldKey,
            body: SafeArea(
                minimum: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Content'),
                      controller: _contentController,
                      onChanged: (text) {
                        setState(() {
                          _transaction.content = text ?? null;
                        });
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount(money)'),
                      controller: _amountController,
                      onChanged: (text) {
                        setState(() {
                          _transaction.amount =
                              double.tryParse(text) ?? 0; //if error, value = 0
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    ButtonTheme(
                        height: 60,
                        // ignore: deprecated_member_use
                        child: FlatButton(
                          child: Text(
                            'Insert Transaction',
                            style: const TextStyle(fontSize: 18),
                          ),
                          color: Colors.pinkAccent,
                          textColor: Colors.white,
                          onPressed: () {
                            setState(() {
                              _transactions.add(_transaction);
                              // clear content in text field
                              _transaction = Transaction('', 0.0);
                              _contentController.text = '';
                              _amountController.text = '';
                            });
                            //print('Content = $_content, money\'s amount = $_amount');
                            // Display list
                            //ignore: deprecated_member_use
                            _scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text('Transaction List :' +
                                  _transactions.toString()),
                              duration: Duration(seconds: 3),
                            ));
                          },
                        )),
                    Column(
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(Icons.airline_seat_flat_sharp),
                          title: const Text("Test"),
                          subtitle: const Text("data"),
                          onTap: () {
                            print("Taped");
                          },
                        )
                      ],
                    )
                  ],
                ))));
  }
}
