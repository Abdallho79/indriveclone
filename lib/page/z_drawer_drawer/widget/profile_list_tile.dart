import 'package:flutter/material.dart';
import 'package:indriveclone/linkapi_app.dart';
import 'package:indriveclone/page/z_drawer_drawer/widget/coustom_icon.dart';

class ProvileListTile extends StatelessWidget {
  final void Function()? onPressed;
  final String photoPath;
  final String username;
  final double rate;
  const ProvileListTile(
      {super.key,
      required this.onPressed,
      required this.photoPath,
      required this.username,
      required this.rate});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        trailing: CoustomIconButton(
            onPressed: onPressed, icon: Icons.navigate_next_outlined),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
            "${AppLink.imagesPerson}/$photoPath",
            width: 50,
            height: 50,
            fit: BoxFit.fill,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              username,
              style: const TextStyle(
                fontSize: 18,
              ),
              softWrap: true,
              maxLines: 1,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              ...List.generate(5, (index) {
                if (index <= (rate - 1).round()) {
                  return const Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 20, // يمكنك تغيير الحجم حسب الحاجة
                  );
                } else {
                  return const Icon(
                    Icons.star_border_outlined,
                    size: 20, // يمكنك تغيير الحجم حسب الحاجة
                  );
                }
              }),
              const SizedBox(
                width: 5,
              ),
              Text(
                "($rate)",
                style: const TextStyle(fontSize: 14),
              )
            ]),
          ],
        ));
  }
}
