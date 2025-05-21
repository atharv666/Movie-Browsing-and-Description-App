import 'package:flutter/material.dart';
import 'package:moviesapp/components/description.dart';
import 'package:moviesapp/utils/text.dart';

class TV extends StatelessWidget {
  final List tv;

  const TV({super.key, required this.tv});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: "Popular TV Shows", color: Colors.white, size: 22),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            // color: Colors.amber,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tv.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Description(name: tv[index]['name'], description: tv[index]['overview'], bannerurl: 'https://image.tmdb.org/t/p/w500' + tv[index]['backdrop_path'], posterurl: 'https://image.tmdb.org/t/p/w500' + tv[index]['poster_path'], vote: tv[index]['vote_average'].toString(), launch_on: tv[index]['first_air_date']);
                        },
                      )
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 250,
                    child: Column(
                      children: [
                        Container(
                          width: 250,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' + tv[index]['backdrop_path']
                              ),
                              fit: BoxFit.cover
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          // height: 70,
                          child: modified_text(text: tv[index]['name'] != null ? tv[index]['name'] : 'Loading', color: Colors.white, size: 10,),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}