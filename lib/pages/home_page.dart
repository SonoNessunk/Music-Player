import 'package:prova_pala/components/my_drawer.dart';
import 'package:prova_pala/models/playlist_provider.dart';
import 'package:prova_pala/models/song.dart';
import 'package:prova_pala/pages/song_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
	const HomePage({super.key});

	@override
	State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

	late final dynamic playlistProvider;

	@override
	void initState() {
    	super.initState();

		playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
	}

	void goToSong(int songIndex) {
		playlistProvider.currentSongIndex = songIndex;

		Navigator.push(
			context,
			MaterialPageRoute(builder: (context) => const SongPage(),),
		);
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Theme.of(context).colorScheme.surface,
			appBar: AppBar(
					title: const Text("S K I D A L ES"),
				),
			drawer: const MyDrawer(),
			body: Consumer<PlaylistProvider>(
				builder: (context, value, child) {

					final List<Song> playlist = value.playlist;

					return ListView.builder(
						itemCount: playlist.length,
						itemBuilder: (context, index) {

							final Song song = playlist[index];

							return ListTile(
								title: Text(song.songName),
								subtitle: Text(song.artistName),
								leading: Image.asset(song.albumArtImagePath),
								onTap: () => goToSong(index),
							);
						},
					);
				},
			),
		);
	}
}