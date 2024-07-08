extension type UserId._(String value) {
  UserId(this.value) : assert(value.isNotEmpty, '');
}
