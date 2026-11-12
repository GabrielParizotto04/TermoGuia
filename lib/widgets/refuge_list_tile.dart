import 'package:flutter/material.dart';

import '../models/refuge_point.dart';
import 'refuge_image.dart';

class RefugeListTile extends StatelessWidget {
  final RefugePoint point;

  const RefugeListTile({super.key, required this.point});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final imageSize = constraints.maxWidth < 320 ? 64.0 : 88.0;

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RefugeImage(
                  imagePath: point.imagePath,
                  width: imageSize,
                  height: imageSize,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        point.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text('Endereço: ${point.address}'),
                      const SizedBox(height: 6),
                      Text('Horário: ${point.openingHours}'),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: point.categories.map((category) {
                          return Chip(
                            label: Text(category.label),
                            visualDensity: VisualDensity.compact,
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
