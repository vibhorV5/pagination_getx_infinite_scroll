import 'package:flutter/material.dart';

class PhotoItem extends StatelessWidget {
  final String title;
  final String url;

  const PhotoItem(this.title, this.url, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          color: Colors.blue.withOpacity(0.3)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(height: 50, width: 50, child: Image.network(url)),
          ],
        ),
      ),
    );
  }
}
