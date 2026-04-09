import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imdb_app/models/movie_model.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({super.key, required this.movies});
  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 150,
          child: CarouselSlider.builder(
            options: CarouselOptions(
              height: 150, // 🔥 MUHIM
              viewportFraction: 0.9, // 🔥 card ko‘rinadi
              autoPlay: true,
            ),
            itemCount: 5,
            itemBuilder: (context, index, realIndex) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                padding: EdgeInsets.all(10),
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(movies[index].primaryImage),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 300,
                      child: Text(
                        '"${movies[index].primaryTitle}" ${movies[index].productionCompanies.first.name}',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Text(
                      movies[index].averageRating.toString(),
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Featured today',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'New and Upcoming Prequels, Sequels, and Spin-Offs',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Color(0xffB4B4B4),
            ),
          ),
        ),
        SizedBox(height: 4),
        SizedBox(
          height: 130,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (_, int index) {
              return SizedBox(
                height: 130,
                child: Column(
                  children: [
                    Container(
                      height: 108,
                      width: 74,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(movies[index + 10].primaryImage),
                        ),
                      ),
                    ),
                    SizedBox(height: 3),
                    SizedBox(
                      width: 74,
                      child: Text(
                        movies[index + 10].primaryTitle,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                        ),
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Has Your Favorite Show Been Renewed or Canceled?',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Color(0xffB4B4B4),
            ),
          ),
        ),
        SizedBox(height: 4),
        SizedBox(
          height: 108,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (_, int index) {
              return Container(
                height: 108,
                width: 74,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(movies[index + 20].primaryImage),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'What to watch',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'New and Upcoming Prequels, Sequels, and Spin-Offs',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Color(0xffB4B4B4),
            ),
          ),
        ),
        SizedBox(height: 4),
        SizedBox(
          height: 130,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (_, int index) {
              return SizedBox(
                height: 130,
                child: Column(
                  children: [
                    Container(
                      height: 108,
                      width: 74,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(movies[index + 30].primaryImage),
                        ),
                      ),
                    ),
                    SizedBox(height: 3),
                    SizedBox(
                      width: 74,
                      child: Text(
                        movies[index + 30].primaryTitle,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                        ),
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
