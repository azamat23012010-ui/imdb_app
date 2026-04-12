import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imdb_app/models/movie_model.dart';
import 'package:imdb_app/widgets/detail_tabbar.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.movie});
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(25),
                child: Image.network(
                  movie.primaryImage,
                  height: 241,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  movie.primaryTitle,
                  style: GoogleFonts.workSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 13),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      DateFormat("yyyy").format(movie.releaseDate!),
                      style: GoogleFonts.workSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xffb4b4b4),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      movie.countriesOfOrigin.first,
                      style: GoogleFonts.workSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xffb4b4b4),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      movie.genres.first,
                      style: GoogleFonts.workSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      movie.genres.last,
                      style: GoogleFonts.workSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 13),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.grey.shade900,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: Text('Add to watchlist'),
                      items: [
                        DropdownMenuItem(
                          value: 'watchlist',
                          child: Text('Add to watchlist'),
                        ),
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ),
              SizedBox(height: 21),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          movie.averageRating.toString(),
                          style: GoogleFonts.workSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          movie.numVotes.toString(),
                          style: GoogleFonts.workSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        Text(
                          movie.runtimeMinutes.toString(),
                          style: GoogleFonts.workSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '1s. 10e. (45 m)',
                          style: GoogleFonts.workSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            SharePlus.instance.share(
                              ShareParams(
                                text:
                                    "${movie.primaryTitle} trailer:\n${movie.trailer}",
                              ),
                            );
                          },
                          child: Icon(
                            Icons.share,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                        Text(
                          'Share',
                          style: GoogleFonts.workSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        Icon(
                          CupertinoIcons.info,
                          color: Colors.white,
                          size: 32,
                        ),
                        Text(
                          'Details',
                          style: GoogleFonts.workSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  movie.description,
                  style: GoogleFonts.workSans(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(height: 22),
              TabbarCustom(movie: movie),
            ],
          ),
        ),
      ),
    );
  }
}
