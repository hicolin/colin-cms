<?php
/**
 * User: Colin
 * Time: 2019/1/21 14:20
 */

namespace backend\libs;

use backend\models\Member;
use Yii;
use yii\helpers\Url;

/**
 * 助手类
 * Class Helper
 * @package frontend\controllers
 */
class Helper
{
    /**
     * 获取系统配置信息
     * @param $key
     * @return string
     */
    public static function getSysInfo($key)
    {
     //   return AdminSystem::findOne(['key' => $key])->content;
    }

    /**
     * 获取上传图片路径
     * @param $uploadPath
     * @return string
     */
    public static function imgUrl($uploadPath)
    {
        $imgUrl = Yii::$app->params['imgUrl'];
        $uploadPath = substr($uploadPath,8);
        $imgUrl = $imgUrl.$uploadPath;
        return $imgUrl;
    }

    /**
     * 获取用户头像地址
     * @return mixed|string
     */
    public static function getHeadImg()
    {
        $headImg = Yii::$app->user->identity->head_img;
        if (!$headImg) {
            return Url::to('@web/images/tx.jpg');
        } else {
            if (strpos($headImg, 'http') !== false) {
                return $headImg;
            } else {
                return Helper::imgUrl($headImg);
            }
        }
    }

    /**
     * 生成唯一邀请码
     * @return bool|string
     */
    public static function getInvitation()
    {
        $str = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        do {
            $code = substr(str_shuffle($str), 0, 6);
        } while (Member::find()->where(['invite_code' => $code])->count() > 0);//数据库没有该邀请码才返回
        return $code;
    }

    /**
     * 返回数组信息
     * @param $status
     * @param $msg
     * @return array
     */
    public static function arrData($status, $msg)
    {
        return ['status' => $status, 'msg' => $msg];
    }

    /**
     * 判断是否为微信端
     * @return bool
     */
    public static function isWx()
    {
        return strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') ? true : false;
    }

    /**
     * 生成二维码
     * @param $text
     * @return mixed
     */
    public static function qrcode($text)
    {
        include Yii::getAlias('@root').'/extend/qrcode/phpqrcode/phpqrcode.php';
        return \QRcode::png($text,false,'H',2,1,true);
    }

    /**
     * 写日志
     * @param $file
     * @param $content
     */
    public static function log($file, $content)
    {
        file_put_contents($file, $content.'<br/>',FILE_APPEND);
    }


    /**
     * 短信接口：腾讯云
     * @param $phone
     * @param $random
     * @return array
     */
    public static function sendSms($phone, $random)
    {
        $appId = Yii::$app->params['sms']['appId'];
        $appKey = Yii::$app->params['sms']['appKey'];
        $tplId = Yii::$app->params['sms']['tplId'];
        $sj = 3;
        $curTime = time();
        $wholeUrl = "https://yun.tim.qq.com/v5/tlssmssvr/sendsms?sdkappid=" . $appId . "&random=" . $random;
        // 按照协议组织 post 包体
        $data = new \stdClass();
        $tel = new \stdClass();
        $tel->nationcode = "" . "86";
        $tel->mobile = "" . $phone;
        $data->tel = $tel;
        $data->sig = hash("sha256",
            "appkey=" . $appKey . "&random=" . $random . "&time="
            . $curTime . "&mobile=" . $phone, FALSE);
        $data->tpl_id = $tplId;
        $data->params = array($random, $sj);
        $data->time = $curTime;
        //$data->sign = '云肆网络';//如果只有一个则不需要签名
        $data->extend = '';
        $data->ext = '';
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $wholeUrl);
        curl_setopt($curl, CURLOPT_HEADER, 0);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_POSTFIELDS, json_encode($data));
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
        $ret = curl_exec($curl);
        $res = json_decode($ret, true);
        if ($res['errmsg'] == 'OK') { // 发送成功
            return self::arrData(200, '发送成功');
        }else{
            return self::arrData(100, $res['errmsg']);
        }
    }

    /**
     * 银行卡四要素接口：腾讯云
     * @param $mobile
     * @param $bankcard
     * @param $idCard
     * @param $name
     * @return mixed
     */
    public static function bankcard($mobile,$bankcard, $idCard,$name)
    {
        $dateTime = gmdate("I d F Y H:i:s");
        $SecretId = Yii::$app->params['bankcard']['secretId'];
        $SecretKey = Yii::$app->params['bankcard']['secretKey'];
        $srcStr = "date: " . $dateTime . "\n" . "source: " . "bankcard4";
        $Authen = 'hmac id="' . $SecretId . '", algorithm="hmac-sha1", headers="date source", signature="';
        $signStr = base64_encode(hash_hmac('sha1', $srcStr, $SecretKey, true));
        $Authen = $Authen . $signStr . "\"";
        $url = 'https://service-m5ly0bzh-1256140209.ap-shanghai.apigateway.myqcloud.com/release/bank_card4/verify';
        $bodys = "?bankcard=$bankcard&idcard=$idCard&name=$name&mobile=$mobile";
        $headers = array(
            'Host:service-m5ly0bzh-1256140209.ap-shanghai.apigateway.myqcloud.com',
            'Accept:text/html, */*; q=0.01',
            'Source: bankcard4',
            'Date: ' . $dateTime,
            'Authorization: ' . $Authen,
            'X-Requested-With: XMLHttpRequest',
            'Accept-Encoding: gzip, deflate, sdch'
        );
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_URL, $url . $bodys);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_TIMEOUT, 60);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "GET");
        curl_setopt($ch, CURLOPT_IPRESOLVE, CURL_IPRESOLVE_V4);
        $data = curl_exec($ch);
        $result = json_decode($data,true);
        if ($result['code'] != '0') {
            return self::arrData(100, $result['message']);
        }
        if ($result['code'] == '0' && $result['result']['res'] != 1) {
            return self::arrData(100, $result['result']['description']);
        }
        return self::arrData(200, '认证成功');
    }

    /**
     * 创建并提交 POST 表单
     * @param $data
     * @param $url
     * @return string
     */
    public static function buildForm($data, $url)
    {
        $sHtml = "<!DOCTYPE html><html><head><title>Waiting...</title>";
        $sHtml.= "<meta http-equiv='content-type' content='text/html;charset=utf-8'></head>
      <body><form id='submit' name='pay' action='".$url."' method='post'>";
        foreach($data as $key => $value){
            $sHtml.= "<input type='hidden' name='".$key."' value='".$value."' style='width:90%;'/>";
        }
        $sHtml .= "</form>正在提交订单信息...";
        $sHtml .= "<script>document.forms['submit'].submit();</script></body></html>";
        return $sHtml;
    }

    /**
     * 发送 POST 请求
     * @param $url
     * @param $postData
     * @return bool|string
     */
    public static function sendPost($url, $postData) {
        $postData = http_build_query($postData);
        $options = array(
            'http' => array(
                'method' => 'POST',
                'header' => 'Content-type:application/x-www-form-urlencoded',
                'content' => $postData,
                'timeout' => 15 * 60 // 超时时间（单位:s）
            )
        );
        $context = stream_context_create($options);
        $result = file_get_contents($url, false, $context);
        return $result;
    }

    /**
     * curl 请求
     * @param $url
     * @param int $isPost
     * @param string $dataFields
     * @param string $cookieFile
     * @param bool $v
     * @return mixed
     */
    public static function curl($url, $isPost = 0, $dataFields = '', $cookieFile = '', $v = false) {
        $header = array("Connection: Keep-Alive","Accept: text/html, application/xhtml+xml, */*",
            "Pragma: no-cache", "Accept-Language: zh-Hans-CN,zh-Hans;q=0.8,en-US;q=0.5,en;q=0.3","User-Agent: Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; WOW64; Trident/6.0)");
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HEADER, $v);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
        $isPost && curl_setopt($ch, CURLOPT_POST, $isPost);
        $isPost && curl_setopt($ch, CURLOPT_POSTFIELDS, $dataFields);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        curl_setopt($ch, CURLOPT_ENCODING, 'gzip,deflate');
        $cookieFile && curl_setopt($ch, CURLOPT_COOKIEFILE, $cookieFile);
        $cookieFile && curl_setopt($ch, CURLOPT_COOKIEJAR, $cookieFile);
        $r = curl_exec($ch);
        curl_close($ch);
        return $r;
    }

    /**
     * 获取短链接
     * @param $longUrl
     * @return bool
     */
    public static function getShortUrl($longUrl)
    {
        $source = '1681459862';
        $apiUrl = "http://api.t.sina.com.cn/short_url/shorten.json?source={$source}&url_long=".urlencode($longUrl);
        $res = self::curl($apiUrl);
        $res = json_decode($res,true);
        $shortUrl = $res[0]['url_short'];
        if($shortUrl){
            return $shortUrl;
        }
        return false;
    }

    /**
     * 根据HTTP请求获取用户位置
     */
    public static function getUserLocation()
    {
        $key = "16199cf2aca1fb54d0db495a3140b8cb"; // 高德地图key
        $url = "http://restapi.amap.com/v3/ip?key=$key";
        $json = file_get_contents($url);
        $obj = json_decode($json, true); // 转换数组
        $obj["message"] = $obj["status"] == 0 ? "失败" : "成功";
        return $obj;
    }

    /**
     * 根据 ip 获取 当前城市
     */
    public static function getCityByIp()
    {
        if (! empty($_SERVER["HTTP_CLIENT_IP"])) {
            $cip = $_SERVER["HTTP_CLIENT_IP"];
        } elseif (! empty($_SERVER["HTTP_X_FORWARDED_FOR"])) {
            $cip = $_SERVER["HTTP_X_FORWARDED_FOR"];
        } elseif (! empty($_SERVER["REMOTE_ADDR"])) {
            $cip = $_SERVER["REMOTE_ADDR"];
        } else {
            $cip = "";
        }
        $url = 'http://restapi.amap.com/v3/ip';
        $data = array(
            'output' => 'json',
            'key' => '16199cf2aca1fb54d0db495a3140b8cb',
            'ip' => $cip
        );
        $postData = http_build_query($data);
        $opts = array(
            'http' => array(
                'method' => 'POST',
                'header' => 'Content-type: application/x-www-form-urlencoded',
                'content' => $postData
            )
        );
        $context = stream_context_create($opts);
        $result = file_get_contents($url, false, $context);
        $res = json_decode($result, true);
        if (count($res['province']) == 0) {
            $res['province'] = '北京市';
        }
        if (! empty($res['province']) && $res['province'] == "局域网") {
            $res['province'] = '北京市';
        }
        if (count($res['city']) == 0) {
            $res['city'] = '北京市';
        }
        return $res;
    }

    /**
     * 获取设备类型（安卓 or 苹果）
     * @return string
     */
    public static function getDeviceType()
    {
        $agent = strtolower($_SERVER['HTTP_USER_AGENT']);
        $type = 'other';
        if (strpos($agent, 'iphone') || strpos($agent, 'ipad')){
            $type = 'ios';
        }
        if (strpos($agent, 'android')) {
            $type = 'android';
        }
        return $type;
    }

    /**
     * XML 数据转为数组
     * @param $xml
     * @return mixed
     */
    public static function xmlToArray($xml)
    {
        $array_data = json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)), true);
        return $array_data;
    }

    /**
     * 导出excel格式表
     * @param $filename
     * @param $title
     * @param $data
     */
    public static function exportExcelData($filename, $title, $data)
    {
        header("Content-type: application/vnd.ms-excel");
        header("Content-disposition: attachment; filename=" . $filename . ".xls");
        if (is_array($title)) {
            foreach ($title as $key => $value) {
                echo $value . "\t";
            }
        }
        echo "\n";
        if (is_array($data)) {
            foreach ($data as $key => $value) {
                foreach ($value as $_key => $_value) {
                    echo $_value . "\t";
                }
                echo "\n";
            }
        }
    }

    /**
     * 导出csv格式表
     * @param $filename
     * @param $title
     * @param $data
     */
    public static function exportCsvData($filename, $title, $data)
    {
        header("Content-type: application/vnd.ms-excel");
        header("Content-disposition: attachment; filename=" . $filename . ".csv");
        if (is_array($title)) {
            foreach ($title as $key => $value) {
                echo $value . ",";
            }
        }
        echo "\n";
        if (is_array($data)) {
            foreach ($data as $key => $value) {
                foreach ($value as $_key => $_value) {
                    echo $_value . ",";
                }
                echo "\n";
            }
        }
    }

    /**
     * 校验身份证号码
     * @param $number
     * @return bool
     */
    public static function isIdCard($number)
    {
        //加权因子
        $wi = array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);
        //校验码串
        $ai = array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');
        //按顺序循环处理前17位
        $sigma = 0;
        for ($i = 0; $i < 17; $i++) {
            //提取前17位的其中一位，并将变量类型转为实数
            $b = (int)$number{$i};
            //提取相应的加权因子
            $w = $wi[$i];
            //把从身份证号码中提取的一位数字和加权因子相乘，并累加
            $sigma += $b * $w;
        }
        //计算序号
        $snumber = $sigma % 11;
        //按照序号从校验码串中提取相应的字符。
        $check_number = $ai[$snumber];
        if ($number{17} == $check_number) {
            return true;
        } else {
            return false;
        }
    }



}