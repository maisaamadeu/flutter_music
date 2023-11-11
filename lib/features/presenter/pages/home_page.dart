import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_music/features/data/models/music_model.dart';
import 'package:flutter_music/features/presenter/widgets/drawer_item.dart';
import 'package:flutter_music/features/presenter/widgets/music_card.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final tMusicModel = const MusicModel(
    id: 'R0UASOQ3EV',
    title: 'Rap Da Akatsuki: Os Ninjas Mais Procurados Do Mundo (Nerd Hits)',
    artist: '7 Minutoz',
    audioFileUrl:
        "https://parsefiles.back4app.com/nFhvCrsQLQ940EHEENDDDHQa6quzirVVwAolqaVM/d318693715d44e4386602e1380274af2_music.mp3",
    albumCoverImageUrl:
        "https://parsefiles.back4app.com/nFhvCrsQLQ940EHEENDDDHQa6quzirVVwAolqaVM/09bbf81f2fc834156121092d13806692_image.jpg",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Row(
                children: [
                  Container(
                    color: Color(0xff212124),
                    child: Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CircleAvatar(),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Sair',
                                    style: GoogleFonts.inter(
                                      color: const Color(0xFFFCFCFC),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),
                            Row(
                              children: [
                                const Icon(
                                  Icons.home_rounded,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Página Inicial',
                                    style: GoogleFonts.inter(
                                      color: const Color(0xFFFCFCFC),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),
                            const Text(
                              'MINHAS PLAYLISTS',
                              style: TextStyle(
                                color: Color(0xFF9898A6),
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0.08,
                              ),
                            ),
                            const SizedBox(height: 12),
                            DrawerItem(title: 'Curtidas', onPressed: () {}),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 2,
                    child: Column(),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: Row(children: []),
            ),
          ],
        ),
      ),
    );
  }
}
