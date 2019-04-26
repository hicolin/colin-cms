<?php
/**
 * User: Colin
 * Time: 2019/4/22 18:14
 */

namespace backend\libs;

use backend\controllers\BaseController;
use common\models\UploadForm;
use Yii;
use yii\web\UploadedFile;

/**
 * 常用功能示例代码
 * Class Template
 * @package backend\libs
 */
class Template extends BaseController
{
    /**
     * 图片上传
     * @param string $type
     * @return array
     */
    public function upload($type = 'image')
    {
        if(Yii::$app->request->isAjax){
            $model = new UploadForm();
            if(isset($_FILES['file'])){
                $model->imageFile = UploadedFile::getInstanceByName('file');
            }
            $res = $model->upload($type);
            return $res;
        }
    }

    /**
     * 文件上传
     * @return string
     */
    public function actionUploadFile()
    {
        $model = new UploadForm();
        $model->csvFile = UploadedFile::getInstanceByName('file');
        $pathInfo = pathinfo($model->csvFile->name);
        if ($pathInfo['extension'] != 'csv') {
            return $this->json(100, '请上传CSV格式的文件');
        }
        $res = $model->upload('csv');
        if ($res['status'] == 100) {
            return $this->json(100, $res['msg']);
        }
        return $this->json(200, '上传成功', $res['path']);
    }


    /**
     * CSV文件导入并获取数据
     * @return string
     * @throws \yii\db\Exception
     */
    public function actionImport()
    {
        if (Yii::$app->request->isPost) {
            $file = Yii::$app->request->post('file');
            $filePath = Yii::getAlias('@root') . $file;
            $handle = fopen($filePath, 'r');
            $out = self::inputCsv($handle);
            $len = count($out);
            if ($len == 1) { // 只有表头
                return $this->json(100, '没有任何数据');
            }
            $data = [];
            for ($i = 1; $i < $len; $i++) {
                $data[$i - 1]['tel'] = $out[$i][0];
                $data[$i - 1]['money'] = $out[$i][1];
                $data[$i - 1]['fee'] = $out[$i][2];
                $data[$i - 1]['create_time'] = time();
            }
            $num = Yii::$app->db->createCommand()->batchInsert('admin_match', ['tel', 'money', 'fee', 'create_time']
                , $data)->execute();
            if (!$num) {
                return $this->json(100, '导入失败');
            }
            return $this->json(200, '导入成功');
        }
    }

    /**
     * 解析CSV
     * @param $handle
     * @return array
     */
    public static function inputCsv($handle){
        $out = [];
        $n = 0;
        while($data = fgetcsv($handle,10000)){
            $num = count($data);
            for($i = 0; $i < $num; $i++){
                $out[$n][$i] = $data[$i];
            }
            $n++;
        }
        return $out;
    }

    /**
     * CSV文件导出
     * @param $data
     * @param string $name
     */
    public function csvExport($data, $name = '')
    {
        $csvFileName = $name ? $name . '.csv' : date('YmdHis') . rand(111111, 999999) . '.csv';
        header('Content-Type: application/octet-stream');
        header('Content-Disposition: attachment; filename="' . $csvFileName . '"');
        header('Cache-Control: no-cache, no-store, max-age=0, must-revalidate');
        header('Expires: Mon,26 Jul 1997 05:00:00 GMT');
        header('Content-Transfer-Encoding: binary');
        echo implode("\r\n", $data);
        exit;
    }

    /**
     * 文件下载
     * @param $file_dir
     * @param $file_name
     */
    public static function fileDownload($file_dir, $file_name)
    {
        //检查文件是否存在
        if (!file_exists($file_dir . $file_name)) {
            header('HTTP/1.1 404 NOT FOUND');
        } else {
            //以只读和二进制模式打开文件
            $file = fopen($file_dir . $file_name, "rb");
            //告诉浏览器这是一个文件流格式的文件
            Header("Content-type: application/octet-stream");
            //请求范围的度量单位
            Header("Accept-Ranges: bytes");
            //Content-Length是指定包含于请求或响应中数据的字节长度
            Header("Accept-Length: " . filesize($file_dir . $file_name));
            //用来告诉浏览器，文件是可以当做附件被下载，下载后的文件名称为$file_name该变量的值。
            Header("Content-Disposition: attachment; filename=" . $file_name);
            //读取文件内容并直接输出到浏览器
            echo fread($file, filesize($file_dir . $file_name));
            fclose($file);
            exit ();
        }
    }

    /**
     * php处理耗时任务（借鉴）
     */
    public function handleTimeConsumeTak()
    {
        // 你要跳转的url
        $url = "http://localhost/test/test.php";
        // 如果使用的是php-fpm
        if (function_exists('fastcgi_finish_request')) {
            header("Location: $url");
            ob_flush();
            flush();
            fastcgi_finish_request();
        // Apache ?
        } else {
            header('Content-type: text/html; charset=utf-8');
            if (function_exists('apache_setenv')) apache_setenv('no-gzip', '1');
            ini_set('zlib.output_compression', 0);
            ini_set('implicit_flush', 1);
            echo "<script>location='$url'</script>";
            ob_flush();
            flush();
        }
        // 这里是模拟你的耗时逻辑
        sleep(2);
        for ($i = 0; $i < 100; $i++) {
            file_put_contents('test.log', $i . "\n", FILE_APPEND);
        }
    }


}