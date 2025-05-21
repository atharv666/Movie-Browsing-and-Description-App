import 'package:flutter/material.dart';
import 'package:moviesapp/components/toprated.dart';
import 'package:moviesapp/components/trending.dart';
import 'package:moviesapp/components/tv.dart';
import 'package:moviesapp/utils/text.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    loadmovies();
  }
  
  List trendingmovies = [];
  List topratedmovies = [];
  List tvs = []; //popular tv shows
  final apikey = 'your api key';
  final readaccesstoken = 'your access token';
  loadmovies()async{
    TMDB tmdbwithcustomlogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      )
    );
    Map trendingresult = await tmdbwithcustomlogs.v3.trending.getTrending();
    Map topresult = await tmdbwithcustomlogs.v3.movies.getTopRated();
    Map tvresult = await tmdbwithcustomlogs.v3.tv.getPopular();
    // print(trendingresult);
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topresult['results'];
      tvs = tvresult['results'];
    });
    // print(tvs);
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(child: modified_text(text: ' 🎬  Movies & Shows  📺', color: Colors.white, size: 26,)),
        ),
        body: ListView(
          children: [
            TrendingMovies(trending: trendingmovies),
            TopRated(toprated: topratedmovies),
            TV(tv: tvs),
          ],
        ),
      ),
    );
  }
}
