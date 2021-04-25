# pushd app-core
# if [ -d "build" ]; then rm -Rf build; fi
# cmake -H. -Bbuild
# pushd build
# make
# popd
# popd

# cp app-core/build/lib/*.dylib ./
Push-Location .\app-core

cmake -S . -B build

Push-Location build
cmake --build . --config Debug
cmake --install . --config Debug
Pop-Location

Pop-Location

Copy-Item -Path .\app-core\bin\*.dll -Destination .\