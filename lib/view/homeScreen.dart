import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_ui_player/Controller/videocontroller.dart';

import 'package:video_ui_player/view/Detailscreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Videos'),
      ),
      body: homeProvider.movies.isEmpty
          ? const Center(child: CircularProgressIndicator()) : ListView.builder(
        itemCount: homeProvider.movies.length,
        itemBuilder: (context, index) {
          final movie = homeProvider.movies[index];
          return ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: movie.thumb.startsWith('http')
                      ? NetworkImage('https://img.freepik.com/free-photo/fantasy-elephant-illustration_23-2151548441.jpg')
                      : AssetImage(movie.thumb),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(movie.title),
            subtitle: Text(movie.subtitle),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(movie: movie),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
