import 'package:flutter/widgets.dart';

import 'package:nonime/network/models/recent_models.dart';

class ImageRecentWidget extends StatelessWidget {
  const ImageRecentWidget({super.key, required this.recent});

  final RecentModel recent;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: 180,
        height: 210,
        child: Image.network(
          recent.image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
