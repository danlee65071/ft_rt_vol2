/*
 * @ Author: Daniil Lee
 * @ Create Time: 2022-11-10 13:56:09
 * @ Modified by: Daniil Lee
 * @ Modified time: 2022-11-11 16:09:43
 * @ Description: Scene class implemetation
 */

#pragma once

/*
 *   Class Scene.
 *   Class Scene has singleton realization.
 *   In Scene class objects are create
 */
class Scene
{
private:
    Scene(const Scene &scene);
    Scene &operator=(const Scene &scene);

public:
    Scene();
    ~Scene();
};
