import 'dart:ffi' as ffi;
import 'dart:io' show Platform;
import 'package:ffi/ffi.dart';
import 'generated_bindings.dart';

// typedef void_func = ffi.Void Function();
// typedef Func = void Function();

class CError {
  ffi.Pointer<ffi.Int32> _ptr;

  ffi.Pointer<ffi.Int32> get pointer {
    return _ptr;
  }

  int? get code {
    return _ptr == ffi.nullptr ? null : _ptr.value;
  }

  CError() : _ptr = calloc<ffi.Int32>();
}

void main() {
  final libName = Platform.isWindows ? 'app-core.dll' : 'libapp-core.dylib';
  final dylib = ffi.DynamicLibrary.open(libName);

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

  for (var i = 0; i < 10; i++) {
    var error = calloc<ffi.Int32>();
    final result = api.generateRandomError(error);
    print('generateRandomError - return: $result, error: ${error.value}');
    calloc.free(error);
  }
}
