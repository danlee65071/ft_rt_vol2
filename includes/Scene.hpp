/*
 * @ Author: Daniil Lee
 * @ Create Time: 2022-11-10 13:56:09
 * @ Modified by: Daniil Lee
 * @ Modified time: 2022-11-11 17:50:09
 * @ Description: Scene class implemetation
 */

#pragma once

#include <iostream>
#include <utility>
#include <json/json.h>
#include "Parser.hpp"

/*
 *   Class Scene.
 *   Class Scene has singleton realization.
 *   In Scene class objects are create
 */
class Scene
{
private:
    Json::Value _json;
    Json::Value::Members _objectsName;

    // Singleton
    Scene(const Scene &scene);
    Scene &operator=(const Scene &scene);

public:
    // Constructor
    Scene(Json::Value &&json);
    // Destructor
    ~Scene();

    // Getters
    const Json::Value &getJson() const;
    const Json::Value::Members &getObjectsName() const;
};
