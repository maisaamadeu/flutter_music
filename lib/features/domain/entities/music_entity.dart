import 'package:equatable/equatable.dart';

class MusicEntity extends Equatable {
  final String id;
  final String title;
  final String artist;
  final String audioFileUrl;
  final String albumCoverImageUrl;

  const MusicEntity({
    required this.id,
    required this.title,
    required this.artist,
    required this.audioFileUrl,
    required this.albumCoverImageUrl,
  });

  @override
  List<Object> get props => [
        title,
        artist,
        audioFileUrl,
        albumCoverImageUrl,
      ];
}
