import 'package:concord_ui/global.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ConcordScaffold(
      appBar: ConcordAppBar(title: ""),
    );
  }
}
