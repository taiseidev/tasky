import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

/// ダイアログ表示用のGlobalKey
final navigatorKeyProvider = Provider(
  (_) => GlobalKey<NavigatorState>(),
);
