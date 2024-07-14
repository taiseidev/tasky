import 'dart:io';

class Config {
  Config({required this.baseUrl});

  factory Config.current() {
    const flavor = String.fromEnvironment(_kAppFlavorKey);

    // TODO(onishi): baseUrlは仮なので適切なものに差し替える
    return switch (flavor) {
      'local' => Config(
          baseUrl: 'http://${getLocalhost()}:8080',
        ),
      'dev' => Config(
          baseUrl: 'http://dev.api.example.com',
        ),
      'stg' => Config(
          baseUrl: 'http://stg.api.example.com',
        ),
      'prod' => Config(
          baseUrl: 'http://prod.api.example.com',
        ),
      _ => Config(baseUrl: ''),
    };
  }

  static String getLocalhost() {
    if (Platform.isAndroid) {
      return '10.0.2.2';
    }
    if (Platform.isIOS) {
      return 'localhost';
    }
    return '';
  }

  final String baseUrl;
  static const String _kAppFlavorKey = 'FLUTTER_APP_FLAVOR';
}
