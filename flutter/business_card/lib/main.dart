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

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var _isDark = false;

  @override
  Widget build(BuildContext context) => MaterialApp(
        builder: (context, child) => Material(
          child: Stack(
            children: [
              child ?? const SizedBox.shrink(),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: IconButton(
                    onPressed: () => setState(() => _isDark = !_isDark),
                    icon: Icon(
                      _isDark ? Icons.sunny : Icons.nightlight_round,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        theme: _isDark ? ThemeData.dark() : ThemeData.light(),
        home: const HomePage(),
      );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: CVCard(),
        ),
      ),
    );
  }
}

class CVCard extends StatelessWidget {
  const CVCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CVCardContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Flexible(
            flex: 3,
            child: InfoWidget(),
          ),
          Flexible(
            flex: 2,
            child: AvatarWidget(),
          ),
        ],
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Padding(
          padding: EdgeInsets.all(14.0),
          child: IdentityWidget(),
        ),
        LinksWidget(),
      ],
    );
  }
}

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _avatar,
      fit: BoxFit.fitHeight,
    );
  }
}

class IdentityWidget extends StatelessWidget {
  const IdentityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Илья Обухов',
          style: TextStyle(fontSize: 20, fontFamily: 'Ubuntu'),
        ),
        Text(
          'Двфу',
          style: TextStyle(fontSize: 18, fontFamily: 'Ubuntu'),
        ),
      ],
    );
  }
}

class LinksWidget extends StatelessWidget {
  const LinksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Spacer(
          flex: 1,
        ),
        Flexible(
          flex: 5,
          child: LinkIcon(
            icon: CVIcons.telegram,
            onPressed: () => launchUrl(
              Uri.parse(Links.telegram),
            ),
          ),
        ),
        Flexible(
          flex: 5,
          child: LinkIcon(
            icon: CVIcons.github,
            onPressed: () => launchUrl(
              Uri.parse(Links.github),
            ),
          ),
        ),
        Flexible(
          flex: 5,
          child: LinkIcon(
            icon: CVIcons.vkontakte,
            onPressed: () => launchUrl(
              Uri.parse(Links.vk),
            ),
          ),
        ),
        const Spacer(
          flex: 1,
        ),
      ],
    );
  }
}

class CVCardContainer extends StatelessWidget {
  static const _borderRadius = 16.0;
  final Widget child;

  const CVCardContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.8,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        elevation: 10.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_borderRadius),
          child: child,
        ),
      ),
    );
  }
}

class LinkIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const LinkIcon({Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 35,
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }
}
