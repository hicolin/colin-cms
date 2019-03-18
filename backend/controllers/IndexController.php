<?php
/**
 * User: Colin
 * Time: 2019/2/2 16:52
 */

namespace backend\controllers;


class IndexController extends BaseController
{
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionWelcome()
    {
        return $this->render('welcome');
    }

}