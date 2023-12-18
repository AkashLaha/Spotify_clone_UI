import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/model/current_track.dart';
import 'package:provider/provider.dart';

class CurrentTrack extends StatelessWidget {
  const CurrentTrack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      width: double.infinity,
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            TrackInfo(),
            Spacer(),
            _PlayerControl(),
            Spacer(),
            if (MediaQuery.of(context).size.width > 800) MoreControls(),
          ],
        ),
      ),
    );
  }
}

class TrackInfo extends StatelessWidget {
  const TrackInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<currentTrackModel>().selected;
    if (selected == null) return const SizedBox.shrink();
    return Row(
      children: [
        Image.asset(
          'assets/lofigirl.jpg',
          height: 60,
          width: 60,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              selected.title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              selected.artist,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.grey[300],
                    fontSize: 12,
                  ),
            ),
          ],
        ),
        const SizedBox(
          width: 12,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite_border),
        ),
      ],
    );
  }
}

class _PlayerControl extends StatelessWidget {
  const _PlayerControl({super.key});

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<currentTrackModel>().selected;
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              padding: EdgeInsets.only(),
              onPressed: () {},
              icon: Icon(Icons.shuffle),
              iconSize: 20,
            ),
            IconButton(
              padding: EdgeInsets.only(),
              onPressed: () {},
              icon: Icon(Icons.skip_previous_outlined),
              iconSize: 20,
            ),
            IconButton(
              padding: EdgeInsets.only(),
              onPressed: () {},
              icon: Icon(Icons.play_circle_outline),
              iconSize: 34,
            ),
            IconButton(
              padding: EdgeInsets.only(),
              onPressed: () {},
              icon: Icon(Icons.skip_next_outlined),
              iconSize: 20,
            ),
            IconButton(
              padding: EdgeInsets.only(),
              onPressed: () {},
              icon: Icon(Icons.repeat),
              iconSize: 20,
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            Text(
              '0:00',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              height: 5,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              selected?.duration ?? '0:00',
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ],
    );
  }
}

class MoreControls extends StatelessWidget {
  const MoreControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.devices),
          iconSize: 20,
        ),
        SizedBox(
          width: 3.6,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.volume_up,
          ),
          iconSize: 20,
        ),
        SizedBox(
          width: 4,
        ),
        Container(
          height: 5,
          width: 84,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(2.5),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.fullscreen),
          iconSize: 20,
        ),
      ],
    );
  }
}
