import 'package:flutter/material.dart';
import 'package:pr4/model/items.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key, required this.item});

  final Items item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: AppBar(
        title: Text(item.name),
        backgroundColor: const Color.fromARGB(255, 255, 246, 218),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 15.0),
              child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 246, 218),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 2),
                            ),
                            child: Image.network(
                              item.image,
                              width: MediaQuery.of(context).size.width * 0.65,
                              height: MediaQuery.of(context).size.width * 0.65,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Row(children: [
                          const Text(
                            'Цена: ',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            '${item.cost} ₽',
                            style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 6, 196, 9),
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 0.0, bottom: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 246, 218),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 30.0, bottom: 15.0),
                      child: Text(
                        'О товаре',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, bottom: 30.0, left: 30.0, right: 30.0),
                      child: Text(
                        item.describtion,
                        style: const TextStyle(fontSize: 14),
                        softWrap: true,
                        textAlign: TextAlign.justify,
                        textDirection: TextDirection.ltr,
                      ),
                    ),
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
