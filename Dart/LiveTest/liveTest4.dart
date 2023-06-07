
class Media {
  void play() {
    print('Playing media...');
  }
}

class Song extends Media {
  String artist;

  Song(this.artist);

  @override
  void play() {
    print('Playing song by $artist...');
  }
}

void main() {
  var media = Media();
  var song = Song('Pritom Hasan');

  media.play();
  song.play();
}