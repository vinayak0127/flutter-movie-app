import 'package:flutter/material.dart';
import 'package:movieapp/utils/text.dart';

import '../description.dart';

class Popular_Tv extends StatelessWidget {


  final List popular_tv;
  const Popular_Tv({Key? key, required this.popular_tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modifed_text(text: "Popular TV shows",size: 26,color: Colors.white),
          const SizedBox(height: 20),
          SizedBox(height: 250,
            child: ListView.builder(itemCount: popular_tv.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>Description(
                        name: popular_tv[index]['title'],
                        bannerurl: 'https://image.tmdb.org/t/p/w500'+popular_tv[index]['backdrop_path'],
                        posterurl: 'https://image.tmdb.org/t/p/w500'+popular_tv[index]['poster_path'],
                        description: popular_tv[index]['overview'],
                        vote: popular_tv[index]['vote_average'].toString(),
                        launch_on: popular_tv[index]['release_date'],
                      )));
                    },
                    child: Container(
                      
                      padding: EdgeInsets.all(5),
                      width: 450,
                      child: Column(
                        children: [
                          Container(
                            height:200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500'+popular_tv[index]['backdrop_path'],

                                    ),fit: BoxFit.cover
                                )
                            ),
                          ),
                          const SizedBox(height: 10),
                          modifed_text(text: popular_tv[index]['name'] ?? 'Loading'
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
