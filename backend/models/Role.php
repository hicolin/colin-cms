<?php

namespace backend\models;

/**
 * This is the model class for table "colin_role".
 *
 * @property string $id 用户角色表
 * @property string $name 角色名
 * @property string $description 角色描述
 * @property string $permission 权限
 * @property int $create_time 创建时间
 */
class Role extends Base
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'colin_role';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['create_time'], 'integer'],
            [['name'], 'string', 'max' => 50],
            [['description'], 'string', 'max' => 100],
            [['permission'], 'string', 'max' => 500],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => '角色名',
            'description' => '描述',
            'permission' => '权限',
            'create_time' => '创建时间',
        ];
    }
}
