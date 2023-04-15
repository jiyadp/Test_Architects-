import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injectable.config.dart';


final getIt = GetIt.instance;
@InjectableInit(asExtension: false)
Future<void> configureInjection() async {
  init(getIt,environment:Environment.prod);
}
//  configureInjection() async {
//   await $init(getIt,Environment.prod);
// }
