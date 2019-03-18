<?php
/**
 * User: Colin
 * Time: 2019/3/16 16:04
 */

namespace backend\controllers;

use Yii;
use backend\models\User;
use yii\data\Pagination;

class UserController extends BaseController
{
    public function actionIndex()
    {
        $query = User::find();
        $search = Yii::$app->request->get('search');
        $query = $this->condition($query, $search);
        $pagination = new Pagination([
            'totalCount' => $query->count(),
            'defaultPageSize' => 10,
        ]);
        $models = $query
            ->orderBy('id desc')
            ->offset($pagination->offset)
            ->limit($pagination->limit)
            ->all();
        return $this->render('index', compact('models', 'pagination', 'search'));
    }

    public function condition($query, $search)
    {
        if (isset($search['nickname']) && $search['nickname']) {
            $query = $query->andWhere(['like', 'nickname', $search['nickname']]);
        }
        if (isset($search['tel']) && $search['tel']) {
            $query = $query->andWhere(['like', 'tel', $search['tel']]);
        }
        if (isset($search['b_time']) && $search['b_time']) {
            $bTime = strtotime($search['b_time'] . ' 00:00:00');
            $query = $query->andWhere(['>=', 'create_time', $bTime]);
        }
        if (isset($search['e_time']) && $search['e_time']) {
            $eTime = strtotime($search['e_time'] . ' 23:59:59');
            $query = $query->andWhere(['<=', 'create_time', $eTime]);
        }
        return $query;
    }

}