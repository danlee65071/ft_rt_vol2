/*
 * @ Author: Daniil Lee
 * @ Create Time: 2022-11-10 13:26:37
 * @ Modified by: Daniil Lee
 * @ Modified time: 2022-11-11 17:06:10
 * @ Description: main.cpp
 */

#include <iostream>
#include "RT.hpp"

int main()
{
    Parser parser;
    Scene scene(parser.parseJson("scene/scene1.json"));

    return 0;
}
