import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nonime/network/models/recent_models.dart';
import 'package:nonime/riverpod/recent_riverpod.dart';

class RecentWidget extends ConsumerWidget {
  const RecentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentData = ref.watch(recentRiverpod);

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'Recent Anime',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          recentData.when(
            error: (error, stackTrace) => Text(
              error.toString(),
              style: TextStyle(color: Colors.white),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            data: (data) {
              return Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final RecentModel recent = data[index];
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                width: 180,
                                height: 210,
                                child: Image.network(
                                  recent.cover,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          heightFactor: 1.3,
                          child: SizedBox(
                            width: 165,
                            child: Text(
                              recent.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 165,
                          child: Text(
                            'episode : ${recent.episode}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
