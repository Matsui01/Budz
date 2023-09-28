// ignore_for_file: constant_identifier_names, use_setters_to_change_properties, avoid_classes_with_only_static_members

enum Env { DEV, MOCK, PROD }

class EnvInfo {
  static Env _env = Env.DEV;

  static void initialize(Env environment) {
    EnvInfo._env = environment;
  }

  static String get appName => _env._appTitle;
  static Env get env => _env;
  static bool get isProduction => _env == Env.PROD;
}

extension _EnvProperties on Env {
  static const _appTitles = {
    Env.DEV: 'Budz DEV',
    Env.MOCK: 'Budz MOCK',
    Env.PROD: 'Budz',
  };

  String get _appTitle => _appTitles[this]!;
}
