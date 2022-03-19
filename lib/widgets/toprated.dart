import 'package:flutter/material.dart';
import 'package:movieapp/utils/text.dart';

class TopRatedMovies extends StatelessWidget {


  final List toprated;
  const TopRatedMovies({Key? key, required this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modifed_text(text: "Top Rated Movies",size: 26,color: Colors.white),
          const SizedBox(height: 20),
          SizedBox(height: 270,
            child: ListView.builder(itemCount: toprated.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){

                    },
                    child: SizedBox(width: 140,
                      child: Column(
                        children: [
                          Container(
                            height:200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path'],
                                    )
                                )
                            ),
                          ),
                          const SizedBox(height: 10),
                          modifed_text(text: toprated[index]['title'] ?? 'Loading'
                            ,color: Colors.white,size: 14,)
                        ],
                      ),
                    ),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}
