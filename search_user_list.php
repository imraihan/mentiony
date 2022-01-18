<?php
mysql_connect("localhost","root","");
mysql_selectdb("babynames");

if(isset($_POST['keyword']) && !empty(trim($_POST['keyword']))) {
    $name = $_POST['keyword']; //sanitize

    $name = stripcslashes($name);
    $name = mysql_real_escape_string($name);
    if (preg_match('/\s/', $name) == 0) {
        $list = array();
        $id = 1;
        if ($name != '') {
            $result1 = mysql_query("SELECT  `firstname`, `id` FROM `babynames` WHERE `firstname` LIKE '$name%' GROUP by `firstname` ORDER BY SUM(number) DESC");

            while ($row = mysql_fetch_assoc($result1)) {
                $curobj["id"] = $id;
                $curobj["pk"] = $row['id'];
                $curobj["name"] = $row['firstname'];
                $curobj["avatar"] = "http://cdn0.4dots.com/i/customavatars/avatar7112_1.gif";
                $curobj["info"] = "Bangladesh";
                $curobj["href"] = "http://awesome.dev/user/1234";
                $list[] = $curobj;
                $id++;
            }

            echo json_encode($list);
            // $array = json_decode(json_encode($response->response->docs), true);
        }
    }
}
?>
