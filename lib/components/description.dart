import 'package:flutter/material.dart';
import 'package:moviesapp/utils/text.dart';

class Description extends StatelessWidget {
  final String? name, description, bannerurl, posterurl, vote, launch_on;

  const Description({super.key, required this.name, required this.description, required this.bannerurl, required this.posterurl, required this.vote, required this.launch_on});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(bannerurl!, fit: BoxFit.cover,)
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    child: modified_text(text: " ⭐ Average Rating: $vote", color: Colors.white, size: 18),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: modified_text(text: name != null ? name! : 'Not Loaded', color: Colors.white, size: 24),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: modified_text(text: 'Releasing on - $launch_on', color: Colors.white, size: 14),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 220,
                  width: 110,
                  child: Image.network(posterurl!),
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    child: modified_text(text: description!, color: Colors.white, size: 17),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}