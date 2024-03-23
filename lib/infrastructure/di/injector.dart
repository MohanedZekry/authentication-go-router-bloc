import 'package:get_it/get_it.dart';
import 'package:go_router_authentication/infrastructure/network/base_http_client.dart';
import 'package:go_router_authentication/infrastructure/network/http_client_impl.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  _core();
}

void _core() async {
  sl.registerLazySingleton<BaseHttpClient>(() => (
      HttpClientImpl())
  );
}