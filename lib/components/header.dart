import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String heroImage;
  final String petType;
  const Header({super.key, required this.heroImage, required this.petType});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 199, 108, 1),
            borderRadius: BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(40),
                bottomStart: Radius.circular(40))),
        child: SafeArea(
            child: Row(children: [
          Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Pet Age',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  const Text('Calculator',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Find how old your $petType is in human years...',
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              )),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Image.asset(
                    heroImage,
                    height: 200,
                    width: 200,
                  )
                ],
              ))
        ])));
  }
}
