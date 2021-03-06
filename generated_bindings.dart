// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
import 'dart:ffi' as ffi;

/// AppCore APIs
class AppCoreAPI {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  AppCoreAPI(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  AppCoreAPI.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  void launchApp() {
    return _launchApp();
  }

  late final _launchApp_ptr =
      _lookup<ffi.NativeFunction<_c_launchApp>>('launchApp');
  late final _dart_launchApp _launchApp =
      _launchApp_ptr.asFunction<_dart_launchApp>();

  void shutApp() {
    return _shutApp();
  }

  late final _shutApp_ptr = _lookup<ffi.NativeFunction<_c_shutApp>>('shutApp');
  late final _dart_shutApp _shutApp = _shutApp_ptr.asFunction<_dart_shutApp>();

  ffi.Pointer<ffi.Uint8> getAppData() {
    return _getAppData();
  }

  late final _getAppData_ptr =
      _lookup<ffi.NativeFunction<_c_getAppData>>('getAppData');
  late final _dart_getAppData _getAppData =
      _getAppData_ptr.asFunction<_dart_getAppData>();

  AppMetaResult getAppMeta() {
    return _getAppMeta();
  }

  late final _getAppMeta_ptr =
      _lookup<ffi.NativeFunction<_c_getAppMeta>>('getAppMeta');
  late final _dart_getAppMeta _getAppMeta =
      _getAppMeta_ptr.asFunction<_dart_getAppMeta>();

  int generateRandomError(
    ffi.Pointer<ffi.Int32> error,
  ) {
    return _generateRandomError(
      error,
    );
  }

  late final _generateRandomError_ptr =
      _lookup<ffi.NativeFunction<_c_generateRandomError>>(
          'generateRandomError');
  late final _dart_generateRandomError _generateRandomError =
      _generateRandomError_ptr.asFunction<_dart_generateRandomError>();

  void setObserver(
    int sig,
    ffi.Pointer<ffi.NativeFunction<CALLBACK>> func,
  ) {
    return _setObserver(
      sig,
      func,
    );
  }

  late final _setObserver_ptr =
      _lookup<ffi.NativeFunction<_c_setObserver>>('setObserver');
  late final _dart_setObserver _setObserver =
      _setObserver_ptr.asFunction<_dart_setObserver>();
}

class AppMeta extends ffi.Struct {
  external ffi.Pointer<ffi.Int8> name;

  @ffi.Int32()
  external int majorVersion;

  @ffi.Int32()
  external int minorVersion;
}

class AppMetaResult extends ffi.Struct {
  @ffi.Int32()
  external int status_code;

  external AppMeta data;
}

abstract class Signal {
  static const int kSignalA = 1;
  static const int kSignalB = 2;
}

class SignalAData extends ffi.Struct {
  @ffi.Int32()
  external int data1;

  @ffi.Int32()
  external int data2;
}

typedef _c_launchApp = ffi.Void Function();

typedef _dart_launchApp = void Function();

typedef _c_shutApp = ffi.Void Function();

typedef _dart_shutApp = void Function();

typedef _c_getAppData = ffi.Pointer<ffi.Uint8> Function();

typedef _dart_getAppData = ffi.Pointer<ffi.Uint8> Function();

typedef _c_getAppMeta = AppMetaResult Function();

typedef _dart_getAppMeta = AppMetaResult Function();

typedef _c_generateRandomError = ffi.Int32 Function(
  ffi.Pointer<ffi.Int32> error,
);

typedef _dart_generateRandomError = int Function(
  ffi.Pointer<ffi.Int32> error,
);

typedef CALLBACK = ffi.Void Function(
  ffi.Pointer<ffi.Void>,
);

typedef _c_setObserver = ffi.Void Function(
  ffi.Int32 sig,
  ffi.Pointer<ffi.NativeFunction<CALLBACK>> func,
);

typedef _dart_setObserver = void Function(
  int sig,
  ffi.Pointer<ffi.NativeFunction<CALLBACK>> func,
);
