import 'package:flutter/material.dart';
import 'package:pr4/model/items.dart';
import 'package:pr4/pages/ItemPage.dart';
import 'package:pr4/pages/components/functions.dart';

class ListOfItems extends StatelessWidget {
  const ListOfItems({
    super.key,
    required this.item,
  });

  final Items item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemPage(item: item),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(
            right: 15.0, left: 15.0, top: 5.0, bottom: 10.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.54,
          //height: MediaQuery.of(context).size.height * 0.47,
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
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
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, right: 50.0, left: 50.0),
                child: SizedBox(
                  height: 50.0,
                  child: Text(
                    '${item.name}',
                    style: const TextStyle(fontSize: 16),
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
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
                  const SizedBox(
                    width: 20.0,
                  ),
                  FloatingActionButton(
                    onPressed: () => remItem(findIndexById(item.id)),
                    child: const Icon(Icons.delete),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
