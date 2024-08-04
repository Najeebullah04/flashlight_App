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
          value: SampleItem.removeAds,
          child: Text('Remove Ads'),
        ),
        const PopupMenuItem(
          value: SampleItem.sendFeedback,
          child: Text('Sendfeedback'),
        ),
        const PopupMenuItem(
          value: SampleItem.followUs,
          child: Text('Follow us'),
        ),
        const PopupMenuItem(
          value: SampleItem.setting,
          child: Text('Setting'),
        )
      ],
    );
  }
}
