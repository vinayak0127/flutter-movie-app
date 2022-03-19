import 'package:flutter/material.dart';
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
       colorScheme: const ColorScheme(
         brightness: Brightness.dark,
         surface: Colors.green,
         onSurface: Colors.black,
         // Colors that are not relevant to AppBar in DARK mode:
         primary: Colors.grey,
         onPrimary: Colors.grey,
         secondary: Colors.grey,
         onSecondary: Colors.grey,
         background: Colors.grey,
         onBackground: Colors.grey,
         error: Colors.grey,
         onError: Colors.grey,
       )
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
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map top_rated_result = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tv_result = await tmdbWithCustomLogs.v3.tv.getPopular();
    setState(() {
      trending_movies = trendingresult['results'];
      top_rated_movies = top_rated_result['results'];
      tv = tv_result['results'];
    });
    print(trending_movies);
    print(top_rated_result);
    print(tv_result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Movie App"),
      ),
    );
  }
}