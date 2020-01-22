import 'package:flutter/material.dart';

enum CardLevel { easy, medium, hard }

class ListCard extends StatefulWidget {
  ListCard(
      {Key key,
      this.icon = Icons.settings,
      this.level = CardLevel.easy,
      this.title = "Generic sample",
      this.routeTo = "/"});

  final CardLevel level;
  final String title;
  final IconData icon;
  final String routeTo;

  @override
  _ListCardState createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, widget.routeTo);
          },
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: getColor(widget.level),
              elevation: 10,
              child: Center(
                child: ListTile(
                  leading: Icon(widget.icon, size: 50),
                  title: Text(widget.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                ),
              ))),
    );
  }

  getColor(CardLevel level) {
    switch (level) {
      case CardLevel.easy:
        return Colors.green;
      case CardLevel.medium:
        return Colors.amber;
      case CardLevel.hard:
        return Colors.pink;
      default:
        return Colors.grey;
    }
  }
}
