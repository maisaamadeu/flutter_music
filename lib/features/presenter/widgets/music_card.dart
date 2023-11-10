import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_music/features/data/models/music_model.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicCard extends StatelessWidget {
  const MusicCard({super.key, required this.musicModel});

  final MusicModel musicModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 255,
      height: 375,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadows: const [
          BoxShadow(
            color: Color(0x66000000),
            blurRadius: 28,
            offset: Offset(0, 8),
            spreadRadius: 0,
          )
        ],
        color: Colors.black.withOpacity(0.6),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 255,
                height: 257,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: Image.network(
                  musicModel.albumCoverImageUrl,
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      musicModel.title,
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      musicModel.artist,
                      style: const TextStyle(
                        color: Color(0xFF9898A6),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 105,
            right: 10,
            child: Container(
              width: 40,
              height: 40,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFFFCFCFC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                ),
                shadows: [
                  const BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 5.50,
                    offset: Offset(0, 2.20),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: const Center(
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: Color(0xff171719),
                ),
              ),
            ),
          ),
        ],
      ),
      // Container(
      //   width: 255,
      //   height: 118,
      //   decoration: BoxDecoration(),
      //   clipBehavior: Clip.antiAlias,
      //   child: Column(
      //     children: [
      //       Row(
      //         mainAxisSize: MainAxisSize.min,
      //         mainAxisAlignment: MainAxisAlignment.end,
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: [
      //           Container(
      //             width: 274,
      //             height: 237,
      //             decoration: const BoxDecoration(
      //               image: DecorationImage(
      //                 image: NetworkImage(
      //                     "https://via.placeholder.com/274x237"),
      //                 fit: BoxFit.fill,
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),

      //       ),
      //       Positioned(
      //         left: 0,
      //         top: 257,
      //         child: Container(
      //           width: 255,
      //           height: 118,
      //           clipBehavior: Clip.antiAlias,
      //           decoration: const BoxDecoration(),
      //           child: Stack(
      //             children: [
      //               Positioned(
      //                 left: -6,
      //                 top: -77,
      //                 child: Opacity(
      //                   opacity: 0.40,
      //                   child: Container(
      //                     padding: const EdgeInsets.only(bottom: 30),
      // child: Row(
      //   mainAxisSize: MainAxisSize.min,
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Container(
      //       width: 274,
      //       height: 237,
      //       decoration: const BoxDecoration(
      //         image: DecorationImage(
      //           image: NetworkImage(
      //               "https://via.placeholder.com/274x237"),
      //           fit: BoxFit.fill,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      //                   ),
      //                 ),
      //               ),
      //               Positioned(
      //                 left: 14,
      //                 top: 16,
      //                 child: Container(
      //                   width: 228,
      //                   height: 88,
      //                   clipBehavior: Clip.antiAlias,
      //                   decoration: const BoxDecoration(),
      //                   child: const Stack(
      //                     children: [
      //                       Positioned(
      //                         left: 1,
      //                         top: 0,
      //                         child: Text(
      //                           'NEW FOR YOU',
      //                           style: TextStyle(
      //                             color: Color(0xFFEF2F62),
      //                             fontSize: 10,
      //                             fontFamily: 'Inter',
      //                             fontWeight: FontWeight.w600,
      //                             height: 0.12,
      //                           ),
      //                         ),
      //                       ),
      //                       Positioned(
      //                         left: 1,
      //                         top: 20,
      //                         child: Text(
      //                           'My New Arrivals',
      //                           style: TextStyle(
      //                             color: Color(0xFFFCFCFC),
      //                             fontSize: 18,
      //                             fontFamily: 'Inter',
      //                             fontWeight: FontWeight.w600,
      //                             height: 0.07,
      //                           ),
      //                         ),
      //                       ),
      //                       Positioned(
      //                         left: 1,
      //                         top: 47,
      //                         child: SizedBox(
      //                           width: 197,
      // child: Text(
      //   'Deine Freunde, Moderat, Sebastián Yatra and more',
      //   style: TextStyle(
      //     color: Color(0xFF9898A6),
      //     fontSize: 14,
      //     fontFamily: 'Inter',
      //     fontWeight: FontWeight.w600,
      //     height: 0.10,
      //   ),
      // ),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //       Positioned(
      //         left: 199,
      //         top: 237,
      //         child: Container(
      //           width: 40,
      //           height: 40,
      //           padding: const EdgeInsets.all(12),
      //           clipBehavior: Clip.antiAlias,
      //           decoration: ShapeDecoration(
      //             color: const Color(0xFFFCFCFC),
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(999),
      //             ),
      //             shadows: const [
      //               BoxShadow(
      //                 color: Color(0x19000000),
      //                 blurRadius: 5.50,
      //                 offset: Offset(0, 2.20),
      //                 spreadRadius: 0,
      //               )
      //             ],
      //           ),
      //           child: Row(
      //             mainAxisSize: MainAxisSize.min,
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               Container(
      //                 width: 16,
      //                 height: 16,
      //                 clipBehavior: Clip.antiAlias,
      //                 decoration: const BoxDecoration(),
      //                 child: Row(
      //                   mainAxisSize: MainAxisSize.min,
      //                   mainAxisAlignment: MainAxisAlignment.start,
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Container(
      //                       width: 16,
      //                       height: 16,
      //                       clipBehavior: Clip.antiAlias,
      //                       decoration: const BoxDecoration(),
      //                       child: const Stack(children: []),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
    );
  }
}
