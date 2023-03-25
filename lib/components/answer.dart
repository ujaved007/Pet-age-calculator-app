import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String petType;
  final int years;
  final int months;
  const Answer(
      {super.key,
      required this.petType,
      required this.years,
      required this.months});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          color: Colors.black12),
      child: Text(
        'Your $petType is $years years ${months > 0 ? 'and $months months ' : ''}old in human years.',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
