import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  final Function pageSetter;
  final String currentPage;
  const Navigation(
      {super.key, required this.pageSetter, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          ActionChip(
            label: const Text('Cats'),
            onPressed: () => pageSetter('cat'),
            labelPadding: const EdgeInsets.only(left: 12, right: 12),
            backgroundColor:
                currentPage == 'cat' ? const Color(0xff000072) : Colors.black12,
            labelStyle: TextStyle(
              color:
                  currentPage == 'cat' ? Colors.white : const Color(0xff000072),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          ActionChip(
            label: const Text('Dogs'),
            onPressed: () => pageSetter('dog'),
            labelPadding: const EdgeInsets.only(left: 12, right: 12),
            backgroundColor:
                currentPage == 'dog' ? const Color(0xff000072) : Colors.black12,
            labelStyle: TextStyle(
              color:
                  currentPage == 'dog' ? Colors.white : const Color(0xff000072),
            ),
          )
        ],
      ),
    );
  }
}
