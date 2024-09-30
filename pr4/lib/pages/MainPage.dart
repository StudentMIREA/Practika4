import 'package:flutter/material.dart';
import 'package:pr4/model/items.dart';
import 'package:pr4/pages/AddPage.dart';
import 'package:pr4/pages/ItemPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Items> items = [];

  void NavToAdd(BuildContext context) async {
    Items item = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddPage()),
    );
    setState(() {
      items.add(item);
    });
  }

  /*
  void remItem(int i) {
    setState(() {
      items.removeAt(i);
    });
  }
  */
  void remItem(int i, BuildContext context) {
    showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: const Color.fromARGB(255, 255, 246, 218),
        title: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Удалить товар?',
                style: TextStyle(fontSize: 16.00, color: Colors.black),
              ),
            ),
          ),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber[700]),
            child: const Text('Ок',
                style: TextStyle(color: Colors.black, fontSize: 14.0)),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          TextButton(
            child: const Text('Отмена',
                style: TextStyle(color: Colors.black, fontSize: 14.0)),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
        ],
      ),
    ).then((bool? isDeleted) {
      if (isDeleted != null && isDeleted) {
        setState(() {
          items.removeAt(i);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              'Товар успешно удален',
              style: TextStyle(color: Colors.black, fontSize: 16.0),
            ),
            backgroundColor: Colors.amber[700],
          ),
        );
      }
    });
  }

  int findIndexById(int id) {
    return items.indexWhere((item) => item.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: AppBar(
        title: const Text('Товары'),
        backgroundColor: const Color.fromARGB(255, 255, 246, 218),
      ),
      body: items.isEmpty
          ? const Center(
              child: Text(
              'Товаров нет',
              style: TextStyle(fontSize: 16.00, color: Colors.black),
            ))
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemPage(item: items[index]),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 15.0, left: 15.0, top: 5.0, bottom: 10.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      //height: MediaQuery.of(context).size.height * 0.47,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 246, 218),
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
                                border:
                                    Border.all(color: Colors.grey, width: 2),
                              ),
                              child: Image.network(
                                items[index].image,
                                width: MediaQuery.of(context).size.width * 0.65,
                                height:
                                    MediaQuery.of(context).size.width * 0.65,
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const CircularProgressIndicator();
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.65,
                                    height: MediaQuery.of(context).size.width *
                                        0.65,
                                    color: Colors.amber[200],
                                    child: const Center(
                                        child: Text(
                                      'нет картинки',
                                      softWrap: true,
                                      textAlign: TextAlign.center,
                                    )),
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, bottom: 0.0, right: 50.0, left: 50.0),
                            child: SizedBox(
                              height: 50.0,
                              child: Text(
                                '${items[index].name}',
                                style: const TextStyle(fontSize: 16),
                                softWrap: true,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 50.0, right: 50.0),
                            child: Row(children: [
                              const Text(
                                'Цена: ',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                '${items[index].cost} ₽',
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 6, 196, 9),
                                    fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                      onPressed: () => remItem(
                                          findIndexById(items[index].id),
                                          context),
                                      icon: const Icon(Icons.delete)),
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 255, 246, 218),
        hoverColor: const Color.fromARGB(255, 255, 246, 218),
        onPressed: () => NavToAdd(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
