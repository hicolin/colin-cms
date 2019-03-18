<?php
/**
 * User: Colin
 * Time: 2019/2/1 17:44
 */

namespace api\controllers;


use yii\rest\ActiveController;

class UserController extends ActiveController
{
    public $modelClass = 'common\models\User';

    public function actions()
    {
        $actions = parent::actions();
        unset($actions['index']);
        unset($actions['create']);
        unset($actions['update']);
        unset($actions['delete']);
    }

    public function actionIndex()
    {
        // todo
    }

    public function actionSendEmail()
    {
        // todo
        return 'send-email';
    }

}