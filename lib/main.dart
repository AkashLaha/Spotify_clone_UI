import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/data.dart';
import 'package:spotify_clone/model/current_track.dart';
import 'package:spotify_clone/screens/playlistscreen.dart';
import 'package:spotify_clone/widgets/current_track.dart';

import 'dart:io';

import 'package:spotify_clone/widgets/side_menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && (Platform.isMacOS || Platform.isWindows)) {
    await DesktopWindow.setMinWindowSize(
      const Size(600, 800),
    );
  }

  runApp(
    ChangeNotifierProvider(
      create: (context) => currentTrackModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Spotify UI',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: Colors.black,
        colorScheme: ColorScheme.dark(
          primary: Colors.black,
          background: const Color(0xFF121212),
          secondary: const Color(0xFF10B954),
        ),
        iconTheme: const IconThemeData().copyWith(color: Colors.white),
        textTheme: TextTheme(
          displayMedium: const TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            fontSize: 12,
            color: Colors.grey[300],
            fontWeight: FontWeight.w500,
            letterSpacing: 2,
          ),
          bodyLarge: TextStyle(
            color: Colors.grey[300],
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
          bodyMedium: TextStyle(
            color: Colors.grey[300],
            letterSpacing: 1,
          ),
        ),
      ),
      home: Shell(),
    );
  }
}

class Shell extends StatelessWidget {
  const Shell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                if (MediaQuery.of(context).size.width > 800) SideMenu(),
                Expanded(
                  child: PlayListScreen(
                    playlist: lofihiphopPlaylist,
                  ),
                ),
              ],
            ),
          ),
          CurrentTrack(),
        ],
      ),
    );
  }
}
