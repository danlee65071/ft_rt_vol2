/*
 * @ Author: Daniil Lee
 * @ Create Time: 2022-11-10 13:55:58
 * @ Modified by: Daniil Lee
 * @ Modified time: 2022-11-11 17:52:22
 * @ Description: Scene class implemetation
 */

#include "Scene.hpp"

/*
 *   Constructor
 *   Initialize main Scene class variables
 */
Scene::Scene(Json::Value &&json) : _json(std::move(json))
{
    this->_objectsName = this->_json.getMemberNames();
}

/*
 *   Destructor
 */
Scene::~Scene() {}

/*
 *   Get _json Scene variable
 */
const Json::Value &Scene::getJson() const { return this->_json; }

/*
 *   Get _objectsName Scene variable
 */
const Json::Value::Members &Scene::getObjectsName() const { return this->_objectsName; }
