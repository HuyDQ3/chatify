class BeginRepo {
  Future<void> initial() async {
    await Future.delayed(const Duration(seconds: 0));
  }

  Future<void> downloadResource() async {
    await Future.delayed(const Duration(seconds: 1));
  }
}