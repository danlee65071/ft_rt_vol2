# include "Parser.hpp"
# include <iostream>
# include <cassert>

void ParserTest1()
{
    Parser parser;
    std::string filename = "";
    std::string error_msg;
    std::string real_error_msg("Empty filename!");

    try
    {
        parser.parseJson(filename);
    }
    catch(const std::exception& e)
    {
        error_msg = e.what();
    }
    assert(error_msg == real_error_msg);
    std::cout << "Test1: ok!" << std::endl;
}