import 'package:concord_ui/global.dart';
import 'package:main/main_loader.dart';

typedef ApplicationLoader = Future<ApplicationLoadResult> Function();
typedef ApplicationWidgetBuilder = Widget Function(ApplicationLoadResult);

/// Created as StatefulWidget to prevent FutureBuilder to rerun
/// on application reload/hot reload.
class Splash extends StatefulWidget {
  final ApplicationLoader applicationLoader;
  final ApplicationWidgetBuilder applicationBuilder;

  const Splash({
    Key? key,
    required this.applicationLoader,
    required this.applicationBuilder,
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
    return FutureBuilder<ApplicationLoadResult>(
      future: widget.applicationLoader(),
      builder: (_, snapshot) => snapshot.hasData
          ? widget.applicationBuilder(snapshot.requireData)
          : splashBuilder(),
    );
  }

  @override
  Widget build(BuildContext context) => _widget;
}
