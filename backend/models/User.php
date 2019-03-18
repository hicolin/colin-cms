<?php

namespace backend\models;

/**
 * This is the model class for table "colin_user".
 *
 * @property string $id 后台用户表
 * @property int $role_id 角色id
 * @property string $name 用户名
 * @property string $password 密码
 * @property int $status 状态 1:启用 2:禁用
 * @property int $create_time 创建时间
 */
class User extends Base
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'colin_user';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['role_id', 'status', 'create_time'], 'integer'],
            [['name', 'password'], 'string', 'max' => 100],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'role_id' => '角色ID',
            'name' => '用户名',
            'password' => '密码',
            'status' => '状态',
            'create_time' => '创建时间',
        ];
    }
}
