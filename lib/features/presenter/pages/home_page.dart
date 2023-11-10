import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_music/features/data/models/music_model.dart';
import 'package:flutter_music/features/presenter/widgets/music_card.dart';

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
      body: SizedBox(
        height: 375,
        child: ListView.separated(
          itemCount: 5,
          shrinkWrap: true,
          clipBehavior: Clip.antiAlias,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(
            width: 10,
          ),
          itemBuilder: (context, index) => MusicCard(musicModel: tMusicModel),
        ),
      ),
    );
  }
}
