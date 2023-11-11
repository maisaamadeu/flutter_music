import 'package:flutter_music/core/http_client/http_client.dart';
import 'package:flutter_music/core/usecase/errors/exceptions.dart';
import 'package:flutter_music/features/data/datasources/musics_datasource.dart';
import 'package:flutter_music/features/data/datasources/musics_datasource_implementation.dart';
import 'package:flutter_music/features/data/models/music_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/music_mock.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late IMusicsDatasource datasource;
  late HttpClient client;

  setUp(() {
    client = HttpClientMock();
    datasource = MusicsDatasourceImplementation(client: client);
  });

  const urlExpected = 'https://parseapi.back4app.com/functions/get-musics';

  void successMock() {
    when(() => client.post(urlExpected, map: {})).thenAnswer(
      (_) async => HttpResponse(data: musicMock, statusCode: 200),
    );
  }

  final tListMusicModelExpected = [
    const MusicModel(
      id: 'R0UASOQ3EV',
      title: 'Rap Da Akatsuki: Os Ninjas Mais Procurados Do Mundo (Nerd Hits)',
      artist: '7 Minutoz',
      audioFileUrl:
          "https://parsefiles.back4app.com/nFhvCrsQLQ940EHEENDDDHQa6quzirVVwAolqaVM/d318693715d44e4386602e1380274af2_music.mp3",
      albumCoverImageUrl:
          "https://parsefiles.back4app.com/nFhvCrsQLQ940EHEENDDDHQa6quzirVVwAolqaVM/09bbf81f2fc834156121092d13806692_image.jpg",
    ),
  ];

  test('should call the post method with correct url', () async {
    // Arrange
    successMock();
    // Act
    await datasource.getAllMusics();
    // Assert
    verify(() => client.post(urlExpected, map: {})).called(1);
  });

  test('should return a List MusicModel when is successful', () async {
    // Arrange
    successMock();
    // Act
    final result = await datasource.getAllMusics();
    // Assert
    expect(result, tListMusicModelExpected);
  });

  test('should throw a ServerException when the call is unsuccessful',
      () async {
    // Arrange
    when(() => client.post(urlExpected, map: {})).thenAnswer(
      (_) async => HttpResponse(data: 'something went wrong', statusCode: 400),
    );
    // Act
    final result = datasource.getAllMusics();
    // Assert
    expect(() => result, throwsA(ServerException()));
  });
}
