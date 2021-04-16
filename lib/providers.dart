import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: Map<String, dynamic>())
];
List<SingleChildWidget> dependentServices = [];
List<SingleChildWidget> uiConsumableProviders = [];
