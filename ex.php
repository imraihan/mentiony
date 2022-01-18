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
<form>
    <label for="message_area">No more than 50 characters</label>
    <p>
        <textarea id="message_area" maxlength="50" rows="6" cols="70" onkeyup="countChar(this)"></textarea>
    </p>
    <span class="hint" id="textarea_message"></span>
</form>

<script>
function countChar () {
    $('#message_area').on('keyup',function()
    {
        var maxlen = 50;
        var rest = $(this).attr('maxlength');

        var length = $(this).val().length;
        if(length > rest ){
            $('#textarea_message').text('you have reached the limit of your character')
        }
        else
        {       var z = rest- length;
            $('#textarea_message').text( z +' character is left');
        }
    });
}

</script>














<!--ff-->
<?php

function linkify($value, $protocols = array('http', 'mail'), array $attributes = array())
{
    // Link attributes
    $attr = '';
    foreach ($attributes as $key => $val) {
        $attr = ' ' . $key . '="' . htmlentities($val) . '"';
    }

    $links = array();

    // Extract existing links and tags
    $value = preg_replace_callback('~(<a .*?>.*?</a>|<.*?>)~i', function ($match) use (&$links) { return '<' . array_push($links, $match[1]) . '>'; }, $value);

    // Extract text links for each protocol
    foreach ((array)$protocols as $protocol) {
        switch ($protocol) {
            case 'http':
            case 'https':   $value = preg_replace_callback('~(?:(https?)://([^\s<]+)|(www\.[^\s<]+?\.[^\s<]+))(?<![\.,:])~i', function ($match) use ($protocol, &$links, $attr) { if ($match[1]) $protocol = $match[1]; $link = $match[2] ?: $match[3]; return '<' . array_push($links, "<a $attr href=\"$protocol://$link\">$link</a>") . '>'; }, $value); break;
            default:        $value = preg_replace_callback('~' . preg_quote($protocol, '~') . '://([^\s<]+?)(?<![\.,:])~i', function ($match) use ($protocol, &$links, $attr) { return '<' . array_push($links, "<a $attr href=\"$protocol://{$match[1]}\">{$match[1]}</a>") . '>'; }, $value); break;
        }
    }

// Insert all link
    return preg_replace_callback('/<(\d+)>/', function ($match) use (&$links) { return $links[$match[1] - 1]; }, $value);
}
//linkify($values);
?>
<!--vv-->




<script>
    function link_to_string () {
        var str = new String("Hello world");
        var URL = "www.yo.com";
        console.log(str.link( URL ));
    }
    link_to_string();

</script>