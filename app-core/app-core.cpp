#include "app-core.hpp"
#include <iostream>

uint8_t * appData = nullptr;

void AppCore::launch() {
    appData = new uint8_t[1024];
    memset(appData, 42, 1024);

    std::cout << "App launch." << std::endl;
}

void AppCore::shut() {
    delete []appData;

    std::cout << "App shut." << std::endl;
}