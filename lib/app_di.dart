import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:travel_app/app_di.config.dart';


final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true,
  asExtension: false, // important: set to false for newer versions
)
Future<void> configureDependencies() => $initGetIt(getIt);
