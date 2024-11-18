import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_ui_player/Controller/videocontroller.dart';

import 'package:video_ui_player/Model/model.dart';

class DetailPage extends StatelessWidget {
  final Movie movie;

  const DetailPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: homeProvider.setVideoPlayer(movie.sources),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (homeProvider.chewieController != null) {
                  return Chewie(controller: homeProvider.chewieController!);
                } else {
                  return const Center(child: Text('Error loading video'));
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              movie.description,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
