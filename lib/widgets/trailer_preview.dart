import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class TrailerPreview extends StatelessWidget {
  final String youtubeUrl;

  const TrailerPreview({super.key, required this.youtubeUrl});

  String getVideoId(String url) {
    return Uri.parse(url).queryParameters['v'] ?? '';
  }

  Future<void> openPlayer(BuildContext context) async {
    final uri = Uri.parse(youtubeUrl);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      print('xato chiqdi kor');
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Video not response !",
            style: GoogleFonts.workSans(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final videoId = getVideoId(youtubeUrl);
    final thumbnail = "https://img.youtube.com/vi/$videoId/0.jpg";

    return GestureDetector(
      onTap: () => openPlayer(context),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 90,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(thumbnail),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Icon(Icons.play_arrow_outlined, size: 15, color: Colors.white),
        ],
      ),
    );
  }
}
