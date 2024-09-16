#include "ada.h"
#include <boost/algorithm/string.hpp>
#include <cstdlib>
#include <iostream>
#include <string>
using namespace std;
using namespace boost;

#define PROJECT_NAME "url-info"

int main(int argc, char *argv[]) {
    if (argc < 2) {
        cout << "No arguments provided." << endl;
        return EXIT_FAILURE;
    }

    auto url = ada::parse<ada::url>(argv[1]);
    if (!url) {
        cout << "Argument \"" << argv[1] << "\" is not a URL" << endl;
        cout << "Example URL to use: https://example.org" << endl;
        return EXIT_FAILURE;
    }

    // U+003A ":" is not needed when simply printing
    string protocol_trimmed = url->get_protocol();
    algorithm::erase_tail(protocol_trimmed, 1);

    // string port = url->get_port();
    // if (port.empty()) {
    //     port = "No port specified";
    // }

    cout << "Protocol: " << protocol_trimmed << endl;
    cout << "Host: " << url->get_host() << endl;
    cout << "Port: " << url->get_port() << endl;
    return EXIT_SUCCESS;
}
