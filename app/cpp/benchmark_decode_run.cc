//
// Created by kiah on 2022/8/14.
//
#include <iostream>
#include <string>
#include "benchmark_decode_lib.h"
#include "decoder_main_lib.h"
#include "encoder_main_lib.h"
#include "lyra_config.h"

using namespace std;

int main(int argc, char *argv[]) {

    if (argc < 2) {
        cout << "no valid model path" << endl;
        return -1;
    }

    chromemedia::codec::benchmark_decode(10,
                                         argv[1]);
}