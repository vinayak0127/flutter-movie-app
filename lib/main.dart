import 'package:flutter/material.dart';
import 'package:movieapp/utils/text.dart';
import 'package:movieapp/widgets/toprated.dart';
import 'package:movieapp/widgets/trending.dart';
import 'package:movieapp/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark,
       primaryColor: Colors.black
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List trending_movies = [];
  List top_rated_movies = [];
  List tv = [];
  final String api_key = "51ed1e6acb4ce61bd03b29a5b6582cfe";
  final read_access_token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MWVkMWU2YWNiNGNlNjFiZDAzYjI5YTViNjU4MmNmZSIsInN1YiI6IjYyMzFhODgxYmVmZDkxMDA3NGM3MTU1ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ijdO48EDP6Gm8rUwVNUpOEbf3CNG4DvcJdaBAOdHDZ4";

  void initState(){
    loadmovies();
    super.initState();
  }

  loadmovies()async{
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(api_key,read_access_token),
    logConfig: const ConfigLogger(
      showLogs: true,
      showErrorLogs: true
    ));
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();
    setState(() {
      trending_movies = trendingResult['results'];
      top_rated_movies = topRatedResult['results'];
      tv = tvResult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const modifed_text(text: 'Netflix', size: 18,color: Colors.red),
      ),
      body: ListView(
          children: [
              Popular_Tv(popular_tv: tv ),
              TreandingMovies(trending: trending_movies),
              TopRatedMovies(toprated: top_rated_movies),
          ],
      ),
    );
  }
}