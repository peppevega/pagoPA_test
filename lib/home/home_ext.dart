import 'package:flutter/material.dart';

extension HomeExt on Widget {
  Padding dateItemDetail(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 3.0, bottom: 3.0),
      child: Row(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                value,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding textItemDetail(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 3.0, bottom: 3.0),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                value,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
