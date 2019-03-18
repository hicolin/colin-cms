<?php
/**
 * User: Colin
 * Time: 2019/2/2 16:52
 */

namespace backend\controllers;


use yii\helpers\VarDumper;
use yii\web\Controller;

class BaseController extends Controller
{
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
            return json_encode(['status' => $status, 'msg' => $msg, 'data' => $data]);
        } else {
            return json_encode(['status' => $status, 'msg' => $msg]);
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