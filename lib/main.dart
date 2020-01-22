import 'package:flutter/material.dart';
import 'package:flutter_europe_challenges/card.dart';
import 'package:flutter_europe_challenges/samples/animated_button.dart';
import 'package:flutter_europe_challenges/samples/animated_tween.dart';
import 'package:flutter_europe_challenges/samples/bottom_sheet.dart';
import 'package:flutter_europe_challenges/samples/calc_grid.dart';
import 'package:flutter_europe_challenges/samples/card_list.dart';
import 'package:flutter_europe_challenges/samples/wave_animation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Europe contest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => SamplesList(),
        '/animated_button': (context) => AnimatedButton(),
        '/animated_wave': (context) => AnimatedWaveContainer(),
        '/animated_tween': (context) => CustomTweenDemo(),
        '/calc_grid': (context) => CalculatorGrid(),
        '/bottom_sheet': (context) => BottomSheetDemo(),
        '/cards_list': (context) => CardsDemo()

      },
    );
  }
}

class SamplesList extends StatefulWidget {
  SamplesList({Key key}) : super(key: key);

  @override
  _SamplesListState createState() => _SamplesListState();
}

class _SamplesListState extends State<SamplesList> {
  final List<ListCard> samplesList = [
    ListCard(
      level: CardLevel.easy,
      icon: Icons.check_circle_outline,
      title: "Animated button",
      routeTo: "/animated_button",
    ),
    ListCard(
      level: CardLevel.easy,
      icon: Icons.check_circle_outline,
      title: "Show bottom modal",
      routeTo: "/bottom_sheet",
    ),
    ListCard(
      level: CardLevel.medium,
      icon: Icons.data_usage,
      title: "Cards list",
      routeTo: "/cards_list",
    ),
    ListCard(
      level: CardLevel.medium,
      icon: Icons.toc,
      title: "Tween animation",
      routeTo: "/animated_tween",
    ),
    ListCard(
      level: CardLevel.medium,
      icon: Icons.crop_square,
      title: "Calculator grid",
      routeTo: "/calc_grid",
    ),
    ListCard(
      level: CardLevel.hard,
      icon: Icons.watch,
      title: "Animated wave",
      routeTo: "/animated_wave",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Flutter Europe contest'),
      ),
      body: new ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: samplesList.length,
          itemBuilder: (context, i) => samplesList[i]),
    );
  }
}
