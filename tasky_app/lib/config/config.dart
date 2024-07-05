class Config {
  Config({required this.baseUrl});

  final String baseUrl;
  static const String _kAppFlavorKey = 'FLUTTER_APP_FLAVOR';

  static Config get current {
    const flavor = String.fromEnvironment(_kAppFlavorKey);

    // TODO(onishi): baseUrlは仮なので適切なものに差し替える
    return switch (flavor) {
      'dev' => Config(
          baseUrl: 'https://dev.api.example.com',
        ),
      'stg' => Config(
          baseUrl: 'https://stg.api.example.com',
        ),
      'prod' => Config(
          baseUrl: 'https://prod.api.example.com',
        ),
      _ => Config(baseUrl: ''),
    };
  }
}
