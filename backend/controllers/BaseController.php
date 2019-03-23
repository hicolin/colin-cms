<?php
/**
 * User: Colin
 * Time: 2019/2/2 16:52
 */

namespace backend\controllers;


use backend\models\Role;
use backend\models\Route;
use backend\models\User;
use yii\helpers\VarDumper;
use yii\web\Controller;
use Yii;
class BaseController extends Controller
{
    public function beforeAction($action)
    {
        if (Yii::$app->user->isGuest) {
            $this->redirect(['site/login']);
            return false;
        }
        $user = User::findOne(Yii::$app->user->getId());
        $role = Role::findOne(['id' => $user->role_id]);
        $permission = json_decode($role->permission);
        $routes = Route::find()->where(['in', 'id', $permission])->asArray()->all();
        $permissionArr = array_column($routes, 'route');
        $allowUrl = ['index/index', 'index/welcome', 'index/clear-cache'];
        if (!in_array($this->route, $allowUrl)  && !in_array($this->route, $permissionArr)) {
            echo $this->json(100, '抱歉，没有权限');
            return false;
        }
        return parent::beforeAction($action);
    }
    
    /**
     * ajax 返回json数据
     * @param $status
     * @param $msg
     * @param string $data
     * @return string
     */
    public function json($status, $msg, $data = '')
    {
        if ($data) {
            return json_encode(['status' => $status, 'msg' => $msg, 'data' => $data], JSON_UNESCAPED_UNICODE);
        } else {
            return json_encode(['status' => $status, 'msg' => $msg], JSON_UNESCAPED_UNICODE);
        }
    }

    /**
     * 返回数组信息
     * @param $status
     * @param $msg
     * @return array
     */
    public function arrData($status, $msg)
    {
        return ['status' => $status, 'msg' => $msg];
    }

    /**
     * 调试函数（支持语法高亮）
     */
    public function dd(){
        $param = func_get_args();
        foreach ($param as $p)  {
            VarDumper::dump($p, 10, true);
        }
        exit(1);
    }
}