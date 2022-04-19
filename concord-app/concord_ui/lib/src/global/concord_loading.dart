import 'package:concord_ui/scaffold.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ConcordLoading extends StatelessWidget {
  const ConcordLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoadingIndicator(indicatorType: Indicator.ballScale);
  }
}
