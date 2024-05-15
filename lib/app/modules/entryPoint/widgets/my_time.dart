import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_base/app/utils/logger.dart';
import 'package:intl/intl.dart';

class MyTime extends StatefulWidget {
  const MyTime({super.key});

  @override
  State<MyTime> createState() => _MyTimeState();
}

class _MyTimeState extends State<MyTime> {

   
  @override
  void initState() {
  Timer.periodic(const Duration(seconds: 1),(value){
  setState(() {
    
  });
});
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    DateTime time = DateTime.now();
    String formattedTime = DateFormat.Hms().format(time);
     String formattedDate =DateFormat('E, MMM d, y').format(time);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          formattedTime,
          style: theme.textTheme.displayLarge,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          formattedDate,
          style: theme.textTheme.displayMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
