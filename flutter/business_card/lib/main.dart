import 'package:business_card/components/text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_theme.dart';
import 'components/card_container.dart';
import 'components/link_icon.dart';
import 'cv_icons.dart';
import 'lang.dart';

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
  var _locale = Lang.en;

  @override
  Widget build(BuildContext context) => MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: Lang.supportedLocales,
        locale: _locale,
        builder: (context, child) => Material(
          child: Stack(
            children: [
              child ?? const SizedBox.shrink(),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: IconButton(
                        onPressed: () => setState(() => _isDark = !_isDark),
                        icon: Icon(
                          _isDark ? Icons.sunny : Icons.nightlight_round,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkResponse(
                        child: AppText(
                          _locale.languageCode.toUpperCase(),
                        ),
                        onTap: () {
                          final newLocale =
                              Lang.isEn(_locale) ? Lang.ru : Lang.en;
                          setState(() => _locale = newLocale);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        theme: AppTheme.theme(_isDark),
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
      children: [
        AppTitle(Lang.of(context).name),
        AppSubtitle(Lang.of(context).company),
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
              mode: LaunchMode.externalApplication,
            ),
          ),
        ),
        Flexible(
          flex: 5,
          child: LinkIcon(
            icon: CVIcons.github,
            onPressed: () => launchUrl(
              Uri.parse(Links.github),
              mode: LaunchMode.externalApplication,
            ),
          ),
        ),
        Flexible(
          flex: 5,
          child: LinkIcon(
            icon: CVIcons.vkontakte,
            onPressed: () => launchUrl(
              Uri.parse(Links.vk),
              mode: LaunchMode.externalApplication,
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
