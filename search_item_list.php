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
            $result1 = mysql_query("SELECT  `list_name` FROM `babynames` WHERE `list_name` LIKE '$name%' GROUP by `list_name` ORDER BY SUM(number) DESC");

            while ($row = mysql_fetch_assoc($result1)) {
                $curobj["id"] = $id;
                $curobj["pk"] = $pk;
                $curobj["name"] = $row['list_name'];
                $curobj["avatar"] = "http://cdn0.4dots.com/i/customavatars/avatar7112_1.gif";
                $curobj["info"] = "Bangladesh";
                $curobj["href"] = "http://list.com/list/5678";
                $list[] = $curobj;
                $id++;
            }

            echo json_encode($list);
        }
    }
}
?>

