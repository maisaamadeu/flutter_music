import 'package:flutter_music/features/data/models/music_model.dart';

abstract class IMusicsDatasource {
  Future<List<MusicModel>> getAllMusics();
}
