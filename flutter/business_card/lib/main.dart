import 'package:flutter/material.dart';

const _avatar = 'assets/ava.png';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(home: HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: AspectRatio(
            aspectRatio: 1.8,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 10.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Илья Обухов',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  'Двфу',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Spacer(flex: 1),
                              Flexible(
                                flex: 5,
                                child: IconButton(
                                  iconSize: 35,
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.cloud_circle,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 5,
                                child: IconButton(
                                  iconSize: 35,
                                  onPressed: () {},
                                  icon: const Icon(Icons.account_circle),
                                ),
                              ),
                              Flexible(
                                flex: 5,
                                child: IconButton(
                                  iconSize: 35,
                                  onPressed: () {},
                                  icon: const Icon(Icons.circle_notifications),
                                ),
                              ),
                              const Spacer(
                                flex: 1,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                        flex: 2,
                        child: Image.asset(
                          _avatar,
                          fit: BoxFit.fitHeight,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
