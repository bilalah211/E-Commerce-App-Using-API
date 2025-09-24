import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/home_upperpart_model.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: upperListViewItems.length,

      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [Colors.blue.shade800, Colors.grey.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Image.asset(
                  upperListViewItems[index].imageUrl,
                  height: height * height,
                  width: width * width,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                bottom: 90,
                left: 13,
                child: Text(
                  upperListViewItems[index].title,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                bottom: 60,
                left: 13,
                child: Text(
                  upperListViewItems[index].subtitle,
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
                ),
              ),
              Positioned(
                bottom: 5,
                left: 10,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  onPressed: () {},
                  child: Text(
                    upperListViewItems[index].shopNow,
                    style: GoogleFonts.poppins(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
