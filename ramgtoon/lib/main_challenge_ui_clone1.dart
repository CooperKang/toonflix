import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

const List<Map<String, dynamic>> _data = [
  {
    'toHour': '11',
    'toMin': '30',
    'fromHour': '12',
    'fromMin': '20',
    'title': 'DESIGN\nMEETING',
    'others': ['ALEX', 'HELENA', 'NANA'],
    'color': Color(0xFFFDF771),
  },
  {
    'toHour': '12',
    'toMin': '35',
    'fromHour': '14',
    'fromMin': '10',
    'title': 'DAILY\nPROJECT',
    'others': ['ME', 'RICHARD', 'CIRY', '+4'],
    'color': Color(0xFF956DC8),
  },
  {
    'toHour': '15',
    'toMin': '00',
    'fromHour': '12',
    'fromMin': '30',
    'title': 'WEEKLY\nPLANNING',
    'others': ['DEN', 'NANA', 'MARK'],
    'color': Color(0xFFC6ED67),
  },
];

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ), //EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Icon(
                        Icons.person,
                        color: Colors.blue[600],
                        size: 50,
                      ),
                    ),
                    const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 40,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'MONDAY 16',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const Text(
                        'TODAY',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                        child: Icon(
                          Icons.circle,
                          color: Color(0xFFA4337D),
                          size: 10,
                        ),
                      ),
                      for (int i = 17; i < 31; i++)
                        SizedBox(
                          width: 55,
                          child: Text(
                            i.toString(),
                            style: TextStyle(
                              fontSize: 34,
                              color: Colors.white.withOpacity(0.6),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                for (int j = 0; j < _data.length; j++)
                  Container(
                    decoration: BoxDecoration(
                      color: _data[j]['color'],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 25,
                        horizontal: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  _data[j]['toHour'],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  _data[j]['toMin'],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  width: 1,
                                  height: 24,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.black54,
                                    ),
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 3, 0, 3),
                                  ),
                                ),
                                Text(
                                  _data[j]['fromHour'],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  _data[j]['fromMin'],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _data[j]['title'],
                                  style: const TextStyle(
                                    height: 0.9,
                                    color: Colors.black,
                                    fontSize: 55,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  children: [
                                    for (int z = 0;
                                        z < _data[j]['others'].length;
                                        z++)
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 15, 0),
                                        child: Text(
                                          _data[j]['others'][z],
                                          style: TextStyle(
                                            color: _data[j]['others'][z] == 'ME'
                                                ? Colors.black
                                                : Colors.black.withOpacity(0.4),
                                            fontSize: 16,
                                          ),
                                        ),
                                      )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
