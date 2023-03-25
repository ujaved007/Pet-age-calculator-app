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
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            labelPadding:
                const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
            backgroundColor:
                currentPage == 'cat' ? const Color(0xff000072) : Colors.black12,
            labelStyle: TextStyle(
              color:
                  currentPage == 'cat' ? Colors.white : const Color(0xff000072),
              fontSize: 16,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          ActionChip(
            label: const Text('Dogs'),
            onPressed: () => pageSetter('dog'),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            labelPadding:
                const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
            backgroundColor:
                currentPage == 'dog' ? const Color(0xff000072) : Colors.black12,
            labelStyle: TextStyle(
              color:
                  currentPage == 'dog' ? Colors.white : const Color(0xff000072),
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
