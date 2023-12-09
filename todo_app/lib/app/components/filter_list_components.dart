import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../core/widgets/filter_item_widget.dart';

class FilterListComponents extends StatelessWidget {
  const FilterListComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          FilterItemWidget(
            title: 'Todas',
            isSelected: true,
            notificationCount: 32,
            onTap: () {
              print('tapped');
            },
          ),
          SizedBox(
            width: 6,
          ),
          const VerticalDivider(),
          SizedBox(
            width: 6,
          ),
          FilterItemWidget(
            title: 'Abertas',
            isSelected: true,
            notificationCount: -1,
            onTap: () {},
          ),
          SizedBox(
            width: 12,
          ),
          FilterItemWidget(
            title: 'Fechadas',
            isSelected: true,
            notificationCount: 2,
            onTap: () {},
          ),
          SizedBox(
            width: 12,
          ),
          FilterItemWidget(
            title: 'Arquivadas',
            isSelected: true,
            notificationCount: 0,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
