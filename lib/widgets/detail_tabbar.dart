import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imdb_app/models/movie_model.dart';
import 'package:imdb_app/widgets/home_layout_screen_widget.dart';
import 'package:imdb_app/widgets/trailer_preview.dart';

class TabbarCustom extends StatelessWidget {
  const TabbarCustom({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SizedBox(
        height: 150,
        child: Column(
          children: [
            TabBar(
              labelPadding: EdgeInsets.only(left: 40),
              tabAlignment: TabAlignment.start,
              splashFactory: NoSplash.splashFactory,
              overlayColor: MaterialStateProperty.all(
                Colors.transparent,
              ), // 🔥 bosilgandagi rang yo‘q
              isScrollable: true,
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: UnderlineTabIndicator(
                borderRadius: BorderRadius.circular(1),
                borderSide: BorderSide(
                  color: Color(0XFFF5C518),
                  width: 1,
                ),
              ),
              labelStyle: GoogleFonts.workSans(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
              tabs: [
                Tab(text: 'Videos'),
                Tab(text: 'Photos'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SizedBox(
                    height: 90,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      scrollDirection: Axis.horizontal,
                      itemCount: 1,
                      itemBuilder: (_, int index) {
                        return movie.trailer == null
                            ? const TrailerShimmer()
                            : TrailerPreview(
                                youtubeUrl: movie.trailer!,
                              );
                      },
                    ),
                  ),
                  Center(child: Text('Coming soon')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
