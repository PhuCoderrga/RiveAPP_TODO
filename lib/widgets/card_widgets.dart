import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  CardWidget({
    Key? key,
    required this.item,
    required this.handleDelete,
    required this.index,
  }) : super(key: key);

  dynamic item;
  dynamic index;
  final Function handleDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: (index % 2 == 0)
            ? const Color.fromARGB(255, 236, 210, 168)
            : const Color.fromARGB(255, 222, 196, 216),
      ),
      height: 70,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () async {
                if (await confirm(context)) {
                  handleDelete(item.id);
                }
                return;
              },
              child: const Icon(
                Icons.delete_outline,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
