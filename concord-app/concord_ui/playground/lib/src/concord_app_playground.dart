import 'package:scaffold/scaffold.dart';
import 'package:tokens/tokens.dart';

class ConcordAppPlayground<T> extends StatelessWidget {
  final Widget home;
  final ApplicationLoader<T> applicationLoader;

  const ConcordAppPlayground({
    Key? key,
    required this.home,
    required this.applicationLoader,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConcordApp(
      splash: Container(),
      theme: defaultConcordTheme,
      applicationLoader: applicationLoader,
      loadedApplicationBuilder: (_) => home,
      loadingBuilder: (_) => const CircularProgressIndicator(),
    );
  }
}
