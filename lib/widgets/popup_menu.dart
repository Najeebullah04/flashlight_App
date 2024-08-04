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
         PopupMenuItem(
          value: SampleItem.removeAds,
          child: TextButton(onPressed: (){debugPrint("button is clicked ");}, child: Text('Remove Ads') ),
        ),
         PopupMenuItem(
          value: SampleItem.sendFeedback,
          child: TextButton(onPressed: (){ debugPrint("button is clicked ");}, child: Text('Send Feedback') ),

        ),
         PopupMenuItem(
          value: SampleItem.followUs,
           child: TextButton(onPressed: (){debugPrint("button is clicked ");}, child: Text('Follow Us') ),

        ),
         PopupMenuItem(
          value: SampleItem.setting,
          child: TextButton(onPressed: (){debugPrint("button is clicked ");}, child: Text('Setting') ),

        )
      ],
    );
  }
}
