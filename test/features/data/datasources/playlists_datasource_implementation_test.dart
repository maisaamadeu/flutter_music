import 'package:flutter_music/core/http_client/http_client.dart';
import 'package:flutter_music/features/data/datasources/endpoints/back4app_endpoints.dart';
import 'package:flutter_music/features/data/datasources/playlists_datasource.dart';
import 'package:flutter_music/features/data/datasources/playlists_datasource_implementation.dart';
import 'package:flutter_music/features/data/models/music_model.dart';
import 'package:flutter_music/features/data/models/playlist_model.dart';
import 'package:flutter_music/features/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/playlist_mock.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late IPlaylistsDatasource datasource;
  late HttpClient client;

  setUp(() {
    client = HttpClientMock();
    datasource = PlaylistsDatasourceImplementation(client: client);
  });

  const tUserModel = UserModel(
    id: 'H5KamwZOWm',
    username: 'Maísa',
    email: 'email@email.com',
    token: 'r:939cb57fcb9496900714a1ede0d77ab6',
  );

  void successGetAllPlaylistsByUserMock() {
    when(() => client.post(Back4appEndpoints.getAllPlaylistsByUser,
        map: {}, token: tUserModel.token)).thenAnswer(
      (_) async => HttpResponse(data: playlistMock, statusCode: 200),
    );
  }

  void successGetPlaylistById() {
    when(() => client.post(
          Back4appEndpoints.getPlaylistById,
          map: {
            "playlistId": "KAgqGVaPKU",
          },
        )).thenAnswer(
      (_) async => HttpResponse(data: playlistMock, statusCode: 200),
    );
  }

  const tPlaylistModel = PlaylistModel(
    id: 'KAgqGVaPKU',
    name: 'Favoritas',
    musics: [
      MusicModel(
        id: 'R0UASOQ3EV',
        title:
            'Rap Da Akatsuki: Os Ninjas Mais Procurados Do Mundo (Nerd Hits)',
        artist: '7 Minutoz',
        audioFileUrl:
            "https://parsefiles.back4app.com/nFhvCrsQLQ940EHEENDDDHQa6quzirVVwAolqaVM/d318693715d44e4386602e1380274af2_music.mp3",
        albumCoverImageUrl:
            "https://parsefiles.back4app.com/nFhvCrsQLQ940EHEENDDDHQa6quzirVVwAolqaVM/09bbf81f2fc834156121092d13806692_image.jpg",
      ),
    ],
  );

  final tListPlayListModelExpected = [
    const PlaylistModel(
      id: 'KAgqGVaPKU',
      name: 'Favoritas',
      musics: [
        MusicModel(
          id: 'R0UASOQ3EV',
          title:
              'Rap Da Akatsuki: Os Ninjas Mais Procurados Do Mundo (Nerd Hits)',
          artist: '7 Minutoz',
          audioFileUrl:
              "https://parsefiles.back4app.com/nFhvCrsQLQ940EHEENDDDHQa6quzirVVwAolqaVM/d318693715d44e4386602e1380274af2_music.mp3",
          albumCoverImageUrl:
              "https://parsefiles.back4app.com/nFhvCrsQLQ940EHEENDDDHQa6quzirVVwAolqaVM/09bbf81f2fc834156121092d13806692_image.jpg",
        ),
      ],
    ),
  ];

  test('should call the post method with correct url all playlists', () async {
    // Arrange
    successGetAllPlaylistsByUserMock();
    // Act
    await datasource.getAllPlaylistsByUser(user: tUserModel);
    // Assert
    verify(
      () => client.post(Back4appEndpoints.getAllPlaylistsByUser,
          map: {
            "playlistId": tPlaylistModel.id,
          },
          token: tUserModel.token),
    ).called(1);
  });

  test('should call the post method with correct url one playlist', () async {
    // Arrange
    successGetPlaylistById();
    // Act
    await datasource.getPlaylistsById(id: "KAgqGVaPKU");
    // Assert
    verify(
      () => client.post(
        Back4appEndpoints.getPlaylistById,
        map: {
          "playlistId": "KAgqGVaPKU",
        },
      ),
    ).called(1);
  });

  test('should return a PlaylistModel when is successful', () async {
    // Arrange
    successGetPlaylistById();
    // Act
    final result = await datasource.getPlaylistsById(id: "KAgqGVaPKU");
    // Assert
    expect(result, tPlaylistModel);
  });

  test('should return a List PlaylistModel when is successful', () async {
    // Arrange
    successGetAllPlaylistsByUserMock();
    // Act
    final result = await datasource.getAllPlaylistsByUser(user: tUserModel);
    // Assert
    expect(result, tListPlayListModelExpected);
  });
}
