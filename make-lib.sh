pushd app-core
if [ -d "build" ]; then rm -Rf build; fi
cmake -H. -Bbuild
pushd build
make
popd
popd

cp app-core/build/lib/*.dylib ./
