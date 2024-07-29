import 'package:flashlight_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class PopUpmenu extends StatelessWidget {
  final Function(SampleItem) onSelected;
  final SampleItem selectedItem;
  const PopUpmenu(
      {super.key, required this.onSelected, required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        const PopupMenuItem(
          value: SampleItem.item1,
          child: Text('item 1'),
        ),
        const PopupMenuItem(
          value: SampleItem.item2,
          child: Text('item 2sdfsfsdfsfsdf'),
        ),
        const PopupMenuItem(
          value: SampleItem.item2,
          child: Text('item 3'),
        )
      ],
    );
  }
}
