import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class TravelDestination {
  const TravelDestination({
    @required this.title,
    @required this.description,
  });
  final String title;
  final String description;
}

List<TravelDestination> destinations(BuildContext context) => [
      TravelDestination(
        title: "Travel to Warsaw",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque fringilla orci auctor lorem iaculis blandit. Vivamus maximus dictum justo ac scelerisque. Curabitur commodo erat non accumsan pretium. Cras convallis orci sed magna rutrum, ac feugiat purus congue. Donec interdum eros sit amet tortor aliquet ornare. Sed a mollis dolor. Mauris tristique, mi in pretium vestibulum, quam ex sodales nunc, eu scelerisque ligula libero sit amet ante. Donec faucibus sem accumsan velit feugiat placerat. Quisque fringilla turpis quis ultrices aliquam. Donec luctus sem eu dui efficitur, id blandit lectus eleifend. Integer aliquet in lacus non tempor. Nam ac lorem non enim congue luctus ac at sapien.",
      ),
      TravelDestination(
        title: "Travel to Prague",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque fringilla orci auctor lorem iaculis blandit. Vivamus maximus dictum justo ac scelerisque. Curabitur commodo erat non accumsan pretium. Cras convallis orci sed magna rutrum, ac feugiat purus congue. Donec interdum eros sit amet tortor aliquet ornare. Sed a mollis dolor. Mauris tristique, mi in pretium vestibulum, quam ex sodales nunc, eu scelerisque ligula libero sit amet ante. Donec faucibus sem accumsan velit feugiat placerat. Quisque fringilla turpis quis ultrices aliquam. Donec luctus sem eu dui efficitur, id blandit lectus eleifend. Integer aliquet in lacus non tempor. Nam ac lorem non enim congue luctus ac at sapien.",
      ),
      TravelDestination(
        title: "Travel to St. Petersburg",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque fringilla orci auctor lorem iaculis blandit. Vivamus maximus dictum justo ac scelerisque. Curabitur commodo erat non accumsan pretium. Cras convallis orci sed magna rutrum, ac feugiat purus congue. Donec interdum eros sit amet tortor aliquet ornare. Sed a mollis dolor. Mauris tristique, mi in pretium vestibulum, quam ex sodales nunc, eu scelerisque ligula libero sit amet ante. Donec faucibus sem accumsan velit feugiat placerat. Quisque fringilla turpis quis ultrices aliquam. Donec luctus sem eu dui efficitur, id blandit lectus eleifend. Integer aliquet in lacus non tempor. Nam ac lorem non enim congue luctus ac at sapien.",
      ),
      TravelDestination(
        title: "Travel to Rome",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque fringilla orci auctor lorem iaculis blandit. Vivamus maximus dictum justo ac scelerisque. Curabitur commodo erat non accumsan pretium. Cras convallis orci sed magna rutrum, ac feugiat purus congue. Donec interdum eros sit amet tortor aliquet ornare. Sed a mollis dolor. Mauris tristique, mi in pretium vestibulum, quam ex sodales nunc, eu scelerisque ligula libero sit amet ante. Donec faucibus sem accumsan velit feugiat placerat. Quisque fringilla turpis quis ultrices aliquam. Donec luctus sem eu dui efficitur, id blandit lectus eleifend. Integer aliquet in lacus non tempor. Nam ac lorem non enim congue luctus ac at sapien.",
      ),
    ];

class TravelDestinationItem extends StatelessWidget {
  const TravelDestinationItem({Key key, @required this.destination, this.shape})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  static const height = 338.0;
  final TravelDestination destination;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: height,
              child: Card(
                // This ensures that the Card's children are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: shape,
                child: TravelDestinationContent(destination: destination),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TappableTravelDestinationItem extends StatelessWidget {
  const TappableTravelDestinationItem(
      {Key key, @required this.destination, this.shape})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  static const height = 298.0;
  final TravelDestination destination;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: height,
              child: Card(
                // This ensures that the Card's children (including the ink splash) are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: shape,
                child: InkWell(
                  onTap: () {
                    print('Card was tapped');
                  },
                  // Generally, material cards use onSurface with 12% opacity for the pressed state.
                  splashColor:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
                  // Generally, material cards do not have a highlight overlay.
                  highlightColor: Colors.transparent,
                  child: TravelDestinationContent(destination: destination),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectableTravelDestinationItem extends StatefulWidget {
  const SelectableTravelDestinationItem(
      {Key key, @required this.destination, this.shape})
      : assert(destination != null),
        super(key: key);

  final TravelDestination destination;
  final ShapeBorder shape;

  @override
  _SelectableTravelDestinationItemState createState() =>
      _SelectableTravelDestinationItemState();
}

class _SelectableTravelDestinationItemState
    extends State<SelectableTravelDestinationItem> {
  // This height will allow for all the Card's content to fit comfortably within the card.
  static const height = 298.0;
  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: height,
              child: Card(
                // This ensures that the Card's children (including the ink splash) are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: widget.shape,
                child: InkWell(
                  onLongPress: () {
                    print('Selectable card state changed');
                    setState(() {
                      _isSelected = !_isSelected;
                    });
                  },
                  // Generally, material cards use onSurface with 12% opacity for the pressed state.
                  splashColor: colorScheme.onSurface.withOpacity(0.12),
                  // Generally, material cards do not have a highlight overlay.
                  highlightColor: Colors.transparent,
                  child: Stack(
                    children: [
                      Container(
                        color: _isSelected
                            // Generally, material cards use primary with 8% opacity for the selected state.
                            // See: https://material.io/design/interaction/states.html#anatomy
                            ? colorScheme.primary.withOpacity(0.08)
                            : Colors.transparent,
                      ),
                      TravelDestinationContent(destination: widget.destination),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            Icons.check_circle,
                            color: _isSelected
                                ? colorScheme.primary
                                : Colors.transparent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TravelDestinationContent extends StatelessWidget {
  const TravelDestinationContent({Key key, @required this.destination})
      : assert(destination != null),
        super(key: key);

  final TravelDestination destination;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle =
        theme.textTheme.headline.copyWith(color: Colors.white);
    final TextStyle descriptionStyle = theme.textTheme.subhead;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 184,
          child: Stack(
            children: [
              Positioned.fill(
                // In order to have the ink splash appear above the image, you
                // must use Ink.image. This allows the image to be painted as
                // part of the Material and display ink effects above it. Using
                // a standard Image will obscure the ink splash.
                child: Container(
                  color: Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0)
,
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    destination.title,
                    style: titleStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: DefaultTextStyle(
            maxLines: 5,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: descriptionStyle,
            child: Text(
              destination.description,
              style: descriptionStyle.copyWith(color: Colors.black54),
            ),
          ),
        ),
      ],
    );
  }
}

class CardsDemo extends StatefulWidget {
  @override
  _CardsDemoState createState() => _CardsDemoState();
}

class _CardsDemoState extends State<CardsDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Cards list"),
      ),
      body: Scrollbar(
        child: ListView(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          children: [
            for (final destination in destinations(context))
              Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: TravelDestinationItem(destination: destination)),
          ],
        ),
      ),
    );
  }
}
