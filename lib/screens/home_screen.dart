import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imdb_app/service/api_service.dart';
import 'package:imdb_app/widgets/home_body.dart';
import 'package:imdb_app/widgets/home_layout_screen_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: ApiService.getMovies(),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return buildSkeleton();
              }
          
              if (snap.hasError) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        padding: EdgeInsets.all(20),
                        height: 200,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Exception",
                                style: GoogleFonts.workSans(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                snap.error.toString(),
                                style: GoogleFonts.workSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                });
          
                return const SizedBox(); // UI bo‘sh turadi
              }
          
              if (!snap.hasData || snap.data == null) {
                return Center(
                  child: Text(
                    "No data",
                    style: GoogleFonts.workSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                );
              }
          
              return HomeBodyWidget(movies: snap.data!);
            },
          ),
        ),
      ),
    );
  }
}
