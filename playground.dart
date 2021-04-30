import 'dart:ffi' as ffi;
import 'dart:io' show Platform;
import 'package:ffi/ffi.dart';
import 'generated_bindings.dart';

void onSignalA(ffi.Pointer<ffi.Void> data) {
  final typedData = data.cast<SignalAData>();
  final dataRef = typedData.ref;
  print('onSignalA - data1=${dataRef.data1} data2=${dataRef.data2}');
}

void onSignalB(ffi.Pointer<ffi.Void> data) {
  final typedData = data.cast<ffi.Int32>();
  print('onSignalB - data=${typedData.value}');
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

  final metaResult = api.getAppMeta();
  print('getAppMeta status code: ${metaResult.status_code}');
  printMeta(metaResult.data);

  api.shutApp();

  api.setObserver(Signal.kSignalA, ffi.Pointer.fromFunction(onSignalA));
  api.setObserver(Signal.kSignalB, ffi.Pointer.fromFunction(onSignalB));
  for (var i = 0; i < 10; i++) {
    var error = calloc<ffi.Int32>();
    final result = api.generateRandomError(error);
    print('generateRandomError - return: $result, error: ${error.value}');
    calloc.free(error);
  }
}
