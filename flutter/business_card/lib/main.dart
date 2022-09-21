import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'cv_icons.dart';

const _avatar = 'assets/ava.png';

class Links {
  static const github = 'https://github.com/Faner201';
  static const telegram = 'https://t.me/Faner201';
  static const vk = 'https://vk.com/finik69';

  const Links._();
}

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
                                    fontFamily: 'Ubuntu',
                                  ),
                                ),
                                Text(
                                  'Двфу',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Ubuntu',
                                  ),
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
                                  onPressed: () => launchUrl(
                                    Uri.parse(Links.telegram),
                                  ),
                                  icon: const Icon(
                                    CVIcons.telegram,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 5,
                                child: IconButton(
                                  iconSize: 35,
                                  onPressed: () => launchUrl(
                                    Uri.parse(Links.github),
                                  ),
                                  icon: const Icon(CVIcons.github),
                                ),
                              ),
                              Flexible(
                                flex: 5,
                                child: IconButton(
                                  iconSize: 35,
                                  onPressed: () => launchUrl(
                                    Uri.parse(Links.vk),
                                  ),
                                  icon: const Icon(CVIcons.vkontakte),
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
