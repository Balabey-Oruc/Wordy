import 'package:flutter/material.dart';
import 'package:wordy/presentation/detail_page/detail_screen.dart';

import '../../../data/models/list_item_model.dart';

class ListItem extends StatefulWidget {
  const ListItem({
    Key? key,
    required this.listItemModel,
  }) : super(key: key);
  final ListItemModel listItemModel;
  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: widget.listItemModel.hasData
            ? () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        listItemModel: widget.listItemModel,
                      ),
                    ));
              }
            : null,
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: widget.listItemModel.hasData
                ? Colors.grey[300]
                : Colors.orange[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Text(widget.listItemModel.word)),
        ),
      ),
    );
  }
}
