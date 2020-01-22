import 'package:flutter/material.dart';

class BottomSheetDemo extends StatelessWidget {
  BottomSheetDemo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: _ModalBottomSheetDemo(),
    );
  }
}

class _BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        children: [
          Container(
            height: 70,
            child: Center(
              child: Text(
                "Test test test",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: 21,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("difsidfs"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// END bottomSheetDemoModal#1 bottomSheetDemoPersistent#1

// BEGIN bottomSheetDemoModal#2

class _ModalBottomSheetDemo extends StatelessWidget {
  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return _BottomSheetContent();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          _showModalBottomSheet(context);
        },
        child: Text("Show sheet"),
      ),
    );
  }
}
