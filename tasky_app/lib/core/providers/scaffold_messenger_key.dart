import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

/// スナックバー表示用のGlobalKey
final scaffoldMessengerKeyProvider = Provider(
  (_) => GlobalKey<ScaffoldMessengerState>(),
);
