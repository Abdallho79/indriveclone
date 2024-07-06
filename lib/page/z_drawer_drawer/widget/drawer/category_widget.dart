import 'package:flutter/material.dart';

class DrawrerCategoriresWidget extends StatelessWidget {
  final int isActive;
  final int isActivenumber;
  final void Function() onPressed;
  final IconData icon;
  final String categoryname;
  const DrawrerCategoriresWidget(
      {super.key,
      required this.isActive,
      required this.onPressed,
      required this.icon,
      required this.categoryname,
      required this.isActivenumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      color: isActive == isActivenumber ? const Color(0xff323943) : null,
      child: InkWell(
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 10),
            Icon(
              icon,
              color: const Color.fromARGB(255, 117, 116, 116),
              size: 32,
            ),
            const SizedBox(width: 20), // إضافة مسافة بين الأيقونة والنص
            Text(
              categoryname,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
