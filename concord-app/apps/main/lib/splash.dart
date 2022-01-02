import 'package:concord_ui/global.dart';
import 'package:main/main_loader.dart';

typedef InitLoader = Future<LoadResult> Function();
typedef InitWidgetBuilder = Widget Function(LoadResult);

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

  Widget splashBuilder() {
    return const ConcordScaffold(
      appBar: ConcordAppBar(title: ""),
    );
  }

  Widget _buildOnce() {
    return FutureBuilder<LoadResult>(
      future: widget.loader(),
      builder: (_, snapshot) => snapshot.hasData
          ? widget.builder(snapshot.requireData)
          : splashBuilder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _widget;
  }
}
