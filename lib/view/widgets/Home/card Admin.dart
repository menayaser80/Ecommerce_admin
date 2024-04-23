import 'package:flutter/material.dart';

class CardAdmin extends StatelessWidget {
  final String url;
  final String title;
  final void Function()? onclick;

  const CardAdmin(
      {super.key, required this.url, required this.title,required this.onclick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onclick,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              url,
              width: 80,
            ),
            Text("${title}"),
          ],
        ),
      ),
    );
  }
}
