#pragma once
#include <json/json.h>
#include <iostream>
#include <string>
#include <fstream>

class Parser
{
private:
    Json::Value _root;

    Parser(Parser const &copy);
    Parser &operator=(Parser const &source);

    Json::Value parseJson();

public:
    Parser();
    ~Parser();

    Json::Value parseJson(std::string filename);

    // Exceptions
    class EmptyFilenameException : public std::exception
    {
    public:
        const char *what() const throw();
    };
};
