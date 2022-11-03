#pragma once
#include "json.h"
#include <iostream>
#include <string>
#include <fstream>

class Parser {
    private:
        Json::Value _root;

        Parser(Parser const& copy);
        Parser& operator=(Parser const& source);
        
        Json::Value parseJson();

    public:
        Parser();
        ~Parser();
};
