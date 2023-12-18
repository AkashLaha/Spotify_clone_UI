import 'package:flutter/material.dart';
import 'package:spotify_clone/data.dart';

class currentTrackModel extends ChangeNotifier {
  Song? selected;

  void selectSong(Song track) {
    selected = track;
    notifyListeners();
  }
}
