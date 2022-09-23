import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteCell extends StatelessWidget {
  const NoteCell(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.isFavorite,
      required this.buttonAction});

  final String? title;
  final String? subtitle;
  final bool isFavorite;
  final Function buttonAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Row(children: [
        CupertinoButton(
            child: FaIcon(isFavorite
                ? FontAwesomeIcons.solidHeart
                : FontAwesomeIcons.heart),
            onPressed: () {
              buttonAction();
            }),
        const SizedBox(width: 5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title ?? "",
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold)),
              Visibility(
                visible: subtitle != null,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(subtitle ?? "",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
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
