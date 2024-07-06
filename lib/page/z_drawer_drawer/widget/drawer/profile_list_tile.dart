import 'package:flutter/material.dart';
import 'package:indriveclone/page/z_drawer_drawer/widget/drawer/coustom_icon.dart';

class ProvileListTile extends StatelessWidget {
  final void Function()? onPressed;
  final String Imagename;
  final String username;
  final double rate;
  const ProvileListTile(
      {super.key,
      required this.onPressed,
      required this.Imagename,
      required this.username,
      required this.rate});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        trailing: CoustomIconButton(
            onPressed: onPressed, icon: Icons.navigate_next_outlined),
        leading: ClipRRect(
          child: Image.asset(
            Imagename,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              username,
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              ...List.generate(5, (index) {
                if (index <= (rate - 1).round()) {
                  return Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 20, // يمكنك تغيير الحجم حسب الحاجة
                  );
                } else
                  return Icon(
                    Icons.star_border_outlined,
                    color: Colors.white,
                    size: 20, // يمكنك تغيير الحجم حسب الحاجة
                  );
              }),
              SizedBox(
                width: 5,
              ),
              Text(
                "($rate)",
                style: TextStyle(color: Colors.white, fontSize: 14),
              )
            ]),
          ],
        ));
  }
}
