class Song {
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song(
      {required this.title,
      required this.description,
      required this.url,
      required this.coverUrl});

  static List<Song> songs = [
    Song(
      title: 'Goldn',
      description: 'Relax insturment',
      url: 'assets/music/goldn-116392.mp3',
      coverUrl: 'assets/images/rap.jpg',
    ),
    Song(
      title: 'Inspiring',
      description: 'cimenatic-ambient insturment',
      url: 'assets/music/inspiring-cinematic-ambient-116199.mp3',
      coverUrl: 'assets/images/kenny-eliason-38XhGPwzI3U-unsplash.jpg',
    ),
    Song(
      title: 'Lenoell Cassico',
      description: 'The blackest bouquet',
      url: 'assets/music/leonell-cassio-the-blackest-bouquet-118766.mp3',
      coverUrl: 'assets/images/marcela-laskoski-YrtFlrLo2DQ-unsplash.jpg',
    ),
    Song(
      title: 'The Post Sips',
      description: '#8',
      url: 'assets/music/tuesday-glitch-soft-hip-hop-118327.mp3',
      coverUrl: 'assests/images/yasamine-june-fnPSs6CS9Hg-unsplash',
    ),
  ];
}
