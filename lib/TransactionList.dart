import 'package:flutter/material.dart';
import 'package:flutter_tutorials/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  ListView _buildListView() {
    return ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: (index - 1) % 2 == 0 ? Colors.green : Colors.redAccent,
            elevation: 10,
            child: ListTile(
              leading: const Icon(Icons.access_alarm),
              title: Text(transactions[index].content),
              subtitle: Text(
                'Price: ${transactions[index].amount}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              onTap: () {
                print('You clicked: ${transactions[index].content}');
              },
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(height: 400, child: this._buildListView());
  }
}
