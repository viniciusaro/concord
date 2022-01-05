import 'package:concord_ui/global.dart';
import 'package:main/main_loader.dart';

typedef ApplicationLoader = Future<ApplicationLoadResult> Function();
typedef ApplicationWidgetBuilder = Widget Function(ApplicationLoadResult);

class Splash extends StatelessWidget {
  final ApplicationLoader applicationLoader;
  final ApplicationWidgetBuilder applicationBuilder;

  const Splash({
    Key? key,
    required this.applicationLoader,
    required this.applicationBuilder,
  }) : super(key: key);

  Widget splashBuilder() {
    return const ConcordScaffold(
      appBar: ConcordAppBar(title: ""),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApplicationLoadResult>(
      future: applicationLoader(),
      builder: (_, snapshot) => snapshot.hasData
          ? applicationBuilder(snapshot.requireData)
          : splashBuilder(),
    );
  }
}
