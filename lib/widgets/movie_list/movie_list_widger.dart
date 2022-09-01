import 'package:flutter/material.dart';
import '../../constants.dart';

class Movie {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.id,
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}

final movies = [
  Movie(
    id: 1,
    imageName: AppImage.poster,
    title: 'Взаперти',
    time: '24 марта 2022',
    description: 'Джессика чего то там...',
  ),
  Movie(
    id: 2,
    imageName: AppImage.poster,
    title: 'Сзади',
    time: '24 марта 2022',
    description: 'Джессика чего то там...',
  ),
  Movie(
    id: 3,
    imageName: AppImage.poster,
    title: 'Спереди',
    time: '24 марта 2022',
    description: 'Джессика чего то там...',
  ),
  Movie(
    id: 4,
    imageName: AppImage.poster,
    title: 'Снаружи',
    time: '24 марта 2022',
    description: 'Джессика чего то там...',
  ),
  Movie(
    id: 5,
    imageName: AppImage.poster,
    title: 'Внутри',
    time: '24 марта 2022',
    description: 'Джессика чего то там...',
  ),
  Movie(
    id: 6,
    imageName: AppImage.poster,
    title: 'Позади',
    time: '24 марта 2022',
    description: 'Джессика чего то там...',
  ),
  Movie(
    id: 7,
    imageName: AppImage.poster,
    title: 'Сверху',
    time: '24 марта 2022',
    description: 'Джессика чего то там...',
  ),
  Movie(
    id: 8,
    imageName: AppImage.poster,
    title: 'Снизу',
    time: '24 марта 2022',
    description: 'Джессика чего то там...',
  ),
  Movie(
    id: 9,
    imageName: AppImage.poster,
    title: 'Везде и нигде',
    time: '24 марта 2022',
    description: 'Джессика чего то там...',
  ),
];

class MovieListWidget extends StatefulWidget {
  MovieListWidget({Key? key}) : super(key: key);

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {

 var filteredMovies = <Movie>[];

  void _searchMovies() {
    final query = searchController.text;
    if(query.isNotEmpty) {
      filteredMovies = movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }else{
      filteredMovies = movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _searchMovies();
    searchController.addListener(() {_searchMovies();});

  }

  final searchController = TextEditingController();

  void _onMovieTap(int index) {
    final id = movies[index].id;
    Navigator.of(context).pushNamed('/mainScreen/movie_detail', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: EdgeInsets.only(top: 70),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: filteredMovies.length,
            itemExtent: 163,
            itemBuilder: (BuildContext context, int index) {
              final movie = filteredMovies[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black.withOpacity(0.2)),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 8,
                                offset: Offset(3, 2))
                          ]),
                      clipBehavior: Clip.hardEdge,
                      child: Row(
                        children: [
                          Image(image: AssetImage(movie.imageName)),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  movie.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  movie.time,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.grey[500]),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  movie.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => _onMovieTap(index),
                      ),
                    ),
                  ],
                ),
              );
            }),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              labelText: 'Поиск',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white.withAlpha(235)
            ),
          ),
        )
      ],
    );
  }
}
