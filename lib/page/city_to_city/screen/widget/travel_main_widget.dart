import 'package:flutter/material.dart';
import 'package:indriveclone/page/main_widget.dart';

class TravelMainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TheMainWidget(
          onPressed: () {},
          inputText: "Cairo , Street 55",
          staticText: "From",
        ),
        SizedBox(
          height: 15,
        ),
        TheMainWidget(
          onPressed: () {},
          inputText: "",
          staticText: "To",
        ),
      ],
    );
  }
}
