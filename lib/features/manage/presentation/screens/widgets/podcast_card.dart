import 'package:athlink/shared/extensions/media_query_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/utils/image_palette_util.dart';

class PodcastCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String host;
  final String duration;
  final VoidCallback onPlay;

  const PodcastCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.host,
    required this.duration,
    required this.onPlay,
  });

  @override
  State<PodcastCard> createState() => _PodcastCardState();
}

class _PodcastCardState extends State<PodcastCard> {
  Color? _cardColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _extractColor();
  }

  Future<void> _extractColor() async {
    final color = await ImagePalette.getDominantColorFromNetwork(
      widget.imageUrl,
    );
    if (mounted) {
      setState(() {
        _cardColor = color;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get screens width for responsive sizing

    double cardWidth = MediaQuery.of(context).size.width * 0.42;

    return GestureDetector(
      onTap: widget.onPlay,
      child: SizedBox(
        width: cardWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Album image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: AspectRatio(
                aspectRatio: 1, // keep square
                child: Image.network(widget.imageUrl, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 8),
            // Title
            Text(
              widget.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            // Artist
            Text(
              widget.host,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey[400], fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
