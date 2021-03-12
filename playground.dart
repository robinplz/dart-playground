import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';
import 'generated_bindings.dart';

// typedef void_func = ffi.Void Function();
// typedef Func = void Function();

void main() {
  final dylib = ffi.DynamicLibrary.open('libapp-core.dylib');

  // final Func launchApp = dylib.lookup<ffi.NativeFunction<void_func>>('launchApp').asFunction();
  // final Func shutApp = dylib.lookup<ffi.NativeFunction<void_func>>('shutApp').asFunction();

  // launchApp();
  // shutApp();

  var printMeta = (AppMeta meta) {
    print('name: ${meta.name.cast<Utf8>().toDartString()}');
    print('version: ${meta.majorVersion}.${meta.minorVersion}');
  };

  AppCoreAPI api = AppCoreAPI(dylib);
  api.launchApp();
  
  var data = api.getAppData();
  print(data.asTypedList(8));
  
  var meta = api.getAppMeta();
  printMeta(meta);

  api.shutApp();
}
