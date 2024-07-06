import 'package:flutter/material.dart';
import 'package:indriveclone/page/main_widget.dart';

class TravelMainWidget extends StatelessWidget {
  const TravelMainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TheMainWidget(
          onPressed: () {},
          inputText: "Cairo , Street 55",
          staticText: "From",
        ),
        const SizedBox(
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
