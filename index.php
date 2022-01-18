<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Page Description">
    <meta name="author" content="nguyenluat">
    <title>Page Title</title>

    <!-- Bootstrap -->

    <link rel="stylesheet" href="css/jquery.mentiony.css">
    <link rel="stylesheet" href="css/jquery.jscrollpane.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.mousewheel.js"></script>
    <script type="text/javascript" src="js/jquery.mentiony.js"></script>
    <script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>


</head>
<body>
<textarea maxlength="50" id="mention" name="mention" class="mentionClass" onkeyup="countChar(this)"
          rows="4" >Can run multiple instance on 1 pages. Try to @John</textarea>

<div id="msg">50 character is left</div>


<button type="button" id="saveBtn">Save</button>

<!--<input type="submit" name="submit" value="submit">-->
<script type="text/javascript">

    var user_array;
    user_array = [

//        {
//            'id': 10000000,
//            'name': 'Edeme Falgoust',
//            'avatar': 'http://cdn0.4dots.com/i/customavatars/avatar7112_1.gif',
//            'info': 'Netherland',
//            'href': 'http://awesome.dev/user/1234'
//        },
//        {
//            'id': 200000000,
//            'name': 'Angel Falgoust',
//            'avatar': 'http://cdn0.4dots.com/i/customavatars/avatar7112_1.gif',
//            'info': 'Bangladesh',
//            'href': 'http://awesome.dev/user/1234'
//        },
//        {
//            'id': 300000000,
//            'name': 'Zend Questo',
//            'avatar': 'http://cdn0.4dots.com/i/customavatars/avatar7112_1.gif',
//            'info': 'Bangladesh',
//            'href': 'http://awesome.dev/user/1234'
//        }
    ];
    var check_local = Object.keys(user_array).map(function (key) {
        return user_array[key];
    });

//    console.log(check_local);
    function user_mention(check_local) {
        $('textarea').mentiony({
            onDataRequestUser: function (mode, keyword, onDataRequestCompleteCallbackUser, triggertype) {
                if (triggertype === "@") {
                    url = "search_user_list.php";
                } else if (triggertype === "#") {
                    url = "search_item_list.php";
                }

                $.ajax({
                    url: url,
                    method: "post",
                    data: {keyword: keyword},
                    dataType: "json",
                    success: function (response) {
                        var data = response;
                        console.log(data);
                        data = jQuery.grep(data, function (item) {
                            return item.name.toLowerCase().indexOf(keyword.toLowerCase()) > -1;
                        });
                        var array_push = check_local.concat(data);

                        var array_push = Array.prototype.push.apply(data, check_local);
                        console.log(array_push);
                        onDataRequestCompleteCallbackUser.call(this, data);
                        console.log('s');
                        //jscrollpane
//                        $('.mentiony-popover').jScrollPane().data('jsp').destroy();
                        $('.mentiony-popover').jScrollPane();
//                        var api = $('.mentiony-popover').data('jsp');
//                        api.reinitialise();
//                        return false;




                        //popup for windows and mobile popup right side
                        var mention_position = $('#mentiony-popover').position();
                        var mention_width = $('#mentiony-popover').width();
                        var positionX = mention_position.left;
                        var window_width = $(window).width();
                        if (mention_width + positionX > window_width) {
                            $("#mentiony-popover").css({'left': (window_width - mention_width - 15)});
                            $("#mentiony-popover").css({'margin-right': '10px'});
                        }

                    }
                });

            },
            timeOut: 200, // Timeout to show mention after press @//#
        });
    }


    $(document).on('click', '.xMen', function () {
        var d = $(this).parent();
        // $(d).parent().parent().parent().focus();
        $('.xMen').remove();
        $('.xMen').removeAttr('href');
        // $(d).parent().parent().find('.triggertype').remove();
        // $(d).parent().parent().removeAttr('class');

    });
    //    $(document).on('click', function () {
    //     // var d = $(this).parent();
    //     $('.xMen').parent().parent().parent().focus();
    //     $('.xMen').parent().parent().find('.xMen').remove();
    //     $('.xMen').parent().parent().find('.triggertype').remove();
    //     $('.xMen').parent().parent().removeAttr('class');

    // });





var user=[],list = []; 
    $(document).on('click', '#saveBtn', function () {
        var tags = $("a.mentiony-link");
        for (var i = 0; i < tags.length; i++) {
            var profilekey = $(tags[i]).attr('pk');
            var username = $(tags[i]).text().substr(1, $(tags[i]).text().length-2);
            var type = $(tags[i]).text().substr(0,1);
            if (type=="@") {
                user.push('@pk:'+profilekey+':'+username);
            }else{

                list.push('@pk:'+profilekey+':'+username);
            }
            //console.log('@pk:'+profilekey+':'+username);
        }
    });
    user_mention(check_local);
</script>

<br><br>


<?php


   function string_to_link() {
        $pattern = "/@\\[([^:]+):([^\\]]+)]/";
        $string = "@[pk:123456:Bangladesh]";
        $convert = "<a href=\"user/link\">$0<?php echo ($string);?></a>";
        $rest1 = trim($convert);
        $rest = preg_replace($pattern, $rest1, $string);
        echo trim($rest);

    }

    string_to_link();

?>

</body>
<script type="text/javascript">



function countChar () {
    $('#mention').on('keypress',function(e)
    {

        var rest = $(this).attr('maxlength');

        var hiddendiv = document.createElement("div");
        hiddendiv.innerHTML = $(this).val();

        console.log(hiddendiv.innerText);
        var length = hiddendiv.innerText.length;

        // var length = $(this).val().length;
        if(length > rest ){
            $('#msg').text('you have reached the limit of your character');
            return false;
        }
        else
        {       var z = rest- length;
            $('#msg').text( z +' character is left');
        }
    });
}
    

// 

var z = '<span class="mention-area"><span class="highlight"><a href="http://rankmylist.com/pk/4321" class="mentiony-link"><span class="triggertype">#</span>james<button type="button" class="xMen"></button></a></span></span><span class="normal-text"></span>';

    function htmltostring(){
        var stringCheck = '<span class="mention-area"><span class="highlight"><a href="http://rankmylist.com/pk/4321" class="mentiony-link"><span class="triggertype">@</span>james<button type="button" class="xMen"></button></a></span></span><span class="normal-text"></span>';
    var profilekey = stringCheck.split('<span class="mention-area"><span class="highlight"><a href="http://rankmylist.com/pk/')[1].split('" class="mentiony-link"><span class="triggertype">')[0];
    var username = stringCheck.split('@</span>')[1].split('<button type="button" class="xMen"></button></a></span></span><span class="normal-text"></span>')[0];

    console.log('@pk:'+profilekey+':'+username);
    }

htmltostring();


</script>
</html>

