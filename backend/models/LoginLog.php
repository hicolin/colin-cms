<?php

namespace backend\models;

use backend\libs\Helper;
use Yii;

/**
 * This is the model class for table "colin_login_log".
 *
 * @property string $id 登陆日志
 * @property int $user_id 用户id
 * @property string $ip ip地址
 * @property string $address 位置
 * @property string $browser 浏览器
 * @property string $os 操作系统
 * @property string $user_agent 操作系统
 * @property int $create_time 创建时间
 */
class LoginLog extends Base
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'colin_login_log';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id', 'create_time'], 'integer'],
            [['ip'], 'string', 'max' => 20],
            [['address'], 'string', 'max' => 100],
            [['browser'], 'string', 'max' => 100],
            [['os'], 'string', 'max' => 50],
            [['user_agent'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'user_id' => '用户ID',
            'ip' => 'IP地址',
            'address' => '位置',
            'browser' => '浏览器',
            'os' => '操作系统',
            'user_agent' => '用户代理',
            'create_time' => '创建时间',
        ];
    }

    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    public function create($userId)
    {
        $ip = Yii::$app->request->getUserIP();
        $this->user_id = $userId;
        $this->ip = $ip;
        if (in_array($ip, ['::1', '127.0.0.1'])) {
            $location = '本地';
        } else {
            $res = Helper::getLocationByTencentMap($ip);
            if ($res['status'] == 0) {
                $adInfo = $res['result']['ad_info'];
                $location = $adInfo['province'] . ' ' . $adInfo['city'] . ' ' . $adInfo['district'];
            } else {
                $location = '未知';
            }
        }
        $this->address = $location;
        $this->browser = Helper::getBrowser();
        $this->os = Helper::getOs();
        $this->user_agent = Yii::$app->request->userAgent;
        $this->create_time = time();
        $this->save(false);
    }

}
