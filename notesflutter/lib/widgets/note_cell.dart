import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteCell extends StatelessWidget {
  const NoteCell(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.isFavorite});

  final String? title;
  final String? subtitle;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      child: Row(children: [
        CupertinoButton(
            child: FaIcon(isFavorite
                ? FontAwesomeIcons.solidHeart
                : FontAwesomeIcons.heart),
            onPressed: () {}),
        const SizedBox(width: 5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title ?? "", style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(
                height: 5,
              ),
              Text(subtitle ?? "",
                  style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ),
        const Icon(
          Icons.chevron_right,
          color: Colors.grey,
        ),
      ]),
    );
  }
}
