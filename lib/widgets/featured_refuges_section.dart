import 'package:flutter/material.dart';

import '../models/refuge_point.dart';
import 'refuge_image.dart';

class FeaturedRefugesSection extends StatelessWidget {
  final List<RefugePoint> points;

  const FeaturedRefugesSection({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    if (points.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Refúgios em destaque',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: points.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: FeaturedRefugeCard(point: points[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}

class FeaturedRefugeCard extends StatelessWidget {
  final RefugePoint point;

  const FeaturedRefugeCard({super.key, required this.point});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Card(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RefugeImage(
              imagePath: point.imagePath,
              width: double.infinity,
              height: 115,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      point.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    const Icon(Icons.access_time, size: 20),
                    const SizedBox(height: 4),
                    Text(point.openingHours),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
