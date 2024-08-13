import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

class PercentageCard extends StatelessWidget {
  final double loadingPercent;

  const PercentageCard({
    Key? key,
    required this.loadingPercent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(11.0),
        height: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircularPercentIndicator(
                animationDuration: 1000,
                circularStrokeCap: CircularStrokeCap.butt,
                animation: true,
                curve: Curves.decelerate,
                radius: 60,
                lineWidth: 5,
                percent: loadingPercent,
                center: Container(
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AutoSizeText(
                        "22%",
                        maxLines: 1,
                        minFontSize: 0,
                        style: GoogleFonts.questrial(
                          fontSize: 24,
                          color: const Color(0xFF23324F),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AutoSizeText(
                        'Present',
                        maxLines: 1,
                        minFontSize: 0,
                        style: GoogleFonts.questrial(
                          fontSize: 15,
                          color: const Color(0xFF23324F),
                        ),
                      ),
                    ],
                  ),
                ),
                backgroundColor: Colors.red,
                progressColor: Colors.green,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            color: Colors.green,
                            size: 14,
                          ),
                          const SizedBox(width: 7.0),
                          AutoSizeText(
                            'Présence',
                            maxLines: 1,
                            minFontSize: 0,
                            style: GoogleFonts.questrial(
                              color: const Color(0xFF23324F),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            color: Colors.red,
                            size: 14,
                          ),
                          const SizedBox(width: 7.0),
                          AutoSizeText(
                            'Absence',
                            maxLines: 1,
                            minFontSize: 0,
                            style: GoogleFonts.questrial(
                              color: const Color(0xFF23324F),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF23324F),
                          side: const BorderSide(color: Color(0xFF23324F)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          'Détails'.toUpperCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
