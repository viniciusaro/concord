import 'package:loading_indicator/loading_indicator.dart';
import 'package:scaffold/scaffold.dart';

class ConcordLoading extends StatelessWidget {
  const ConcordLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoadingIndicator(indicatorType: Indicator.ballScale);
  }
}
