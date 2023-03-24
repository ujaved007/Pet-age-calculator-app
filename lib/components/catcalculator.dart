import 'package:flutter/material.dart';

class CatCalculator extends StatefulWidget {
  const CatCalculator({super.key});

  @override
  State<CatCalculator> createState() => _CatCalculatorState();
}

class _CatCalculatorState extends State<CatCalculator> {
  calculate() {
    debugPrint('calc');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('How old is your cat?'),
            Container(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                children: const [
                  Text("Years*"),
                  SizedBox(width: 20),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text("Months"),
                  SizedBox(width: 20),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculate,
              child: const Text('Calculate'),
            )
          ],
        ),
      ),
    );
  }
}
