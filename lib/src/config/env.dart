// ignore_for_file: constant_identifier_names, use_setters_to_change_properties, avoid_classes_with_only_static_members
import '../utils/constants/strings.dart';

enum Env { DEV, MOCK, PROD }

abstract class EnvInfo {
  static Env _env = Env.DEV;

  static void initialize(Env environment) {
    EnvInfo._env = environment;
  }

  static String get appName => _env._appTitle;
  static String get connectionString => _env._connectionString;
  static Env get env => _env;
  static bool get isProduction => _env == Env.PROD;
}

extension _EnvProperties on Env {
  static const _appTitles = {
    Env.DEV: 'Budz DEV',
    Env.MOCK: 'Budz MOCK',
    Env.PROD: 'Budz',
  };

  static const _connectionStrings = {
    Env.DEV: baseUrl,
    Env.MOCK: baseUrl,
    Env.PROD: baseUrl,
  };

  String get _appTitle => _appTitles[this]!;
  String get _connectionString => _connectionStrings[this]!;
}
