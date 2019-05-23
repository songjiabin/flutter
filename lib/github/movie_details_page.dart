import 'package:flutter/material.dart';
import 'package:flutter_github/github/actor_scroller.dart';
import 'package:flutter_github/github/models.dart';
import 'package:flutter_github/github/movie_detail_header.dart';
import 'package:flutter_github/github/photo_scroller.dart';
import 'package:flutter_github/github/story_line.dart';


class MovieDetailsPage extends StatelessWidget {


  MovieDetailsPage(this.movie);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MovieDetailHeader(movie),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Storyline(movie.storyline),
            ),
            PhotoScroller(movie.photoUrls),
            SizedBox(height: 20.0),
            ActorScroller(movie.actors),
            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
