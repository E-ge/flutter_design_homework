class Music {
  int music_id;
  String music_name;
  String music_singer;
  String music_albume;
  String music_image;

  Music({
    required this.music_id,
    required this.music_name,
    required this.music_singer,
    required this.music_albume,
    required this.music_image
});
}
Future<List<Music>> musicLoad () async{
  var musicList = <Music>[];
  var m2 = Music(music_id: 2, music_name: "Sextape", music_singer: "Deftones", music_albume: "Diamond Eyes", music_image: "deftons1.jpg");
  var m3 = Music(music_id: 3, music_name: "Born in Winter", music_singer: "Gojira", music_albume: "L'Enfast Sauvage", music_image: "gojira.jpg");
  var m4 = Music(music_id: 4, music_name: "The Messenger", music_singer: "Linkin Park", music_albume: "A Thousand Suns", music_image: "linkinpark.png");
  var m5 = Music(music_id: 5, music_name: "Uprising", music_singer: "Muse", music_albume: "The Resistance", music_image: "muse.jpg");
  var m6 = Music(music_id: 6, music_name: "Time", music_singer: "Pink Floyd", music_albume: "The Dark Side Of The Moon", music_image: "pink.jpg");
  var m7 = Music(music_id: 7, music_name: "Echoes", music_singer: "Pink Floyd", music_albume: "Meddle", music_image: "pink2.jpg");
  var m8 = Music(music_id: 8, music_name: "Have A Cigar", music_singer: "Pink Floyd", music_albume: "Wish You Were Here", music_image: "pink1.jpg");
  var m9 = Music(music_id: 9, music_name: "Ubreakable", music_singer: "Soen", music_albume: "Memorial", music_image: "soen.jpg");

  musicList.add(m2);
  musicList.add(m3);
  musicList.add(m4);
  musicList.add(m5);
  musicList.add(m6);
  musicList.add(m7);
  musicList.add(m8);
  musicList.add(m9);
  return musicList;
}