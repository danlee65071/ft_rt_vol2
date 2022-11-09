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
    std::cout << "\033[0;32mParser test1: ok!" << std::endl;
}

void ParserTest2()
{
    Parser parser;
    std::string filename = "test_scenes/ParserTest2.json";
    Json::Value v = parser.parseJson(filename);

    assert(v["camera"]["x"] == 0.);
    assert(v["camera"]["y"] == 0.);
    assert(v["camera"]["z"] == 0.);
    std::cout << "\033[0;32mParser test2: ok!" << std::endl;
}

void ParserTests()
{
    ParserTest1();
    ParserTest2();
}
