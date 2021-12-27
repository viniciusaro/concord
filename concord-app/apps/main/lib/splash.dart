import 'package:concord_ui/concord_ui.dart';

typedef InitLoader = Future<bool> Function();
typedef InitWidgetBuilder = Widget Function();

class Splash extends StatefulWidget {
  final InitLoader loader;
  final InitWidgetBuilder builder;

  const Splash({
    Key? key,
    required this.loader,
    required this.builder,
  }) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late Widget _widget;

  @override
  void initState() {
    super.initState();
    _widget = _buildOnce();
  }

  Widget loadingBuilder(BuildContext context) {
    return const ConcordLoading();
  }

  ConcordTokens get theme {
    return defaultConcordTheme;
  }

  Widget _buildOnce() {
    return FutureBuilder<bool>(
      future: widget.loader(),
      builder: (context, snapshot) {
        return ConcordApp(
          loadingBuilder: loadingBuilder,
          theme: theme,
          child: snapshot.hasData ? widget.builder() : const SplashStateless(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _widget;
  }
}

class SplashStateless extends StatelessWidget {
  const SplashStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConcordScaffold(
      loading: true,
      body: Container(),
    );
  }
}
