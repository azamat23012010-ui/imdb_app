import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildSkeleton() {
  return Shimmer.fromColors(
    baseColor: const Color(0xFF2A2A2A),
    highlightColor: const Color(0xFF3A3A3A),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔥 CAROUSEL
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: 2,
            itemBuilder: (_, __) {
              return Container(
                width: 320,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 12),

        // 🔥 SECTION 1 TEXT
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(height: 16, width: 180, color: Colors.white),
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(height: 12, width: 250, color: Colors.white),
        ),

        const SizedBox(height: 6),

        // 🔥 LIST 1 (Home bilan bir xil)
        SizedBox(
          height: 130,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (_, __) {
              return Column(
                children: [
                  Container(
                    height: 108,
                    width: 74,
                    margin: const EdgeInsets.only(right: 10),
                    color: Colors.white,
                  ),
                  const SizedBox(height: 3),
                  Container(height: 10, width: 70, color: Colors.white),
                ],
              );
            },
          ),
        ),

        const SizedBox(height: 10),

        // 🔥 SECTION 2 TEXT
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(height: 16, width: 220, color: Colors.white),
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(height: 12, width: 260, color: Colors.white),
        ),

        const SizedBox(height: 6),

        // 🔥 LIST 2
        SizedBox(
          height: 108,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (_, __) {
              return Container(
                height: 108,
                width: 74,
                margin: const EdgeInsets.only(right: 10),
                color: Colors.white,
              );
            },
          ),
        ),

        const SizedBox(height: 10),

        // 🔥 SECTION 3 TEXT
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(height: 16, width: 200, color: Colors.white),
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(height: 12, width: 240, color: Colors.white),
        ),

        const SizedBox(height: 6),

        // 🔥 LIST 3
        SizedBox(
          height: 130,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (_, __) {
              return Column(
                children: [
                  Container(
                    height: 108,
                    width: 74,
                    margin: const EdgeInsets.only(right: 10),
                    color: Colors.white,
                  ),
                  const SizedBox(height: 3),
                  Container(height: 10, width: 70, color: Colors.white),
                ],
              );
            },
          ),
        ),
      ],
    ),
  );
}