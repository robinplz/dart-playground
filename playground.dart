import 'dart:ffi' as ffi;

typedef void_func = ffi.Void Function();
typedef Func = void Function();

void main() {
  final dylib = ffi.DynamicLibrary.open('libapp-core.dylib');

  final Func launchApp = dylib.lookup<ffi.NativeFunction<void_func>>('launchApp').asFunction();
  final Func shutApp = dylib.lookup<ffi.NativeFunction<void_func>>('shutApp').asFunction();

  launchApp();
  shutApp();
}
