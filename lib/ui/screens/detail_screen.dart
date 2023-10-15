import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nonime/network/models/detail_models.dart';

import 'package:nonime/network/models/recent_models.dart';
import 'package:nonime/riverpod/detail_riverpod.dart';
import 'package:nonime/ui/colors/colors.dart';
import 'package:nonime/ui/screens/video_player.dart';
import 'package:nonime/ui/widgets/genre_text_widget.dart';
import 'package:nonime/ui/widgets/season_widget.dart';
import 'package:nonime/ui/widgets/synopsis_text_widget.dart';

class DetailScreen extends ConsumerWidget {
  const DetailScreen({super.key, required this.recent});

  final String recent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataApi = ref.watch(detailRiverpod(recent));

    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: Colors.white,
              icon: const Icon(Icons.arrow_back_ios_new_rounded)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Detail',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: dataApi.when(
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          data: (data) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final DetailModel value = data[index];

                return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Column(
                            children: [
                              SizedBox(
                                width: 250,
                                height: 240,
                                child: Image.network(
                                  value.image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  value.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          GenreTextWidget(
                              text: value.genres
                                  .toString()
                                  .replaceAll('[', '')
                                  .replaceAll(']', '')),
                          SeasonWidget(text: value.season),
                          SynopsisTextWidget(text: value.synopsis),
                          const SizedBox(height: 20),
                        ],
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: value.episode.length,
                        itemBuilder: (context, index) {
                          final Episode episode = value.episode[index];

                          return InkWell(
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => VideoPlayerScreen(
                                  episodeUrl: episode.episodeId),
                            )),
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Card(
                                color: Colors.black,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Episdode ${episode.epsTitle}',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 50)
                    ]);
              },
            );
          },
        ));
  }
}
