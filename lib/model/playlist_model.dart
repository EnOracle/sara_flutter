import 'song_model.dart';

class Playlist {
  final String title;
  final List<Song> songs;
  final String imageUrl;

  Playlist({
    required this.title,
    required this.songs,
    required this.imageUrl,
  });

  static List<Playlist> playlists = [
    Playlist(
      title: 'Goldn',
      songs: Song.songs,
      imageUrl: 'assets/images/rock.jpg',
    ),
    Playlist(
      title: 'Inspiring',
      songs: Song.songs,
      imageUrl: 'assets/images/rap.jpg',
    ),
    Playlist(
      title: 'Lenoell Cassico',
      songs: Song.songs,
      imageUrl: 'assets/images/ragga.jpeg',
    ),
    Playlist(
      title: 'The Post Sips',
      songs: Song.songs,
      imageUrl: 'assets/images/dance.jpg',
    ),
  ];
}
