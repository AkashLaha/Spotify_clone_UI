import 'package:flutter/material.dart';
import 'package:spotify_clone/data.dart';

class PlayListHeader extends StatelessWidget {
  final Playlist playlist;
  const PlayListHeader({super.key, required this.playlist});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              playlist.imageURL,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PLAYLIST',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontSize: 12),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    playlist.name,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    playlist.description,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Created by ${playlist.creator} . ${playlist.songs.length} songs, ${playlist.duration}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        _PlayListButton(followers: playlist.followers),
      ],
    );
  }
}

class _PlayListButton extends StatelessWidget {
  final String followers;
  const _PlayListButton({super.key, required this.followers});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Theme.of(context).colorScheme.secondary,
              foregroundColor: Theme.of(context).iconTheme.color,
              textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 12,
                    letterSpacing: 2.0,
                  )),
          onPressed: () {},
          child: const Text('PLAY'),
        ),
        const SizedBox(
          width: 8,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite_border),
          iconSize: 30,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_horiz),
          iconSize: 30,
        ),
        const Spacer(),
        Text(
          'FOLLOWERS\n${followers}',
          style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 12),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
