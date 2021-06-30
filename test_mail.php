<?php


$to = "sajedaiub@gmail.com,sajed.inviit@gmail.com";
$subject = "My subject";
$txt = "Hello world!";
$headers = "From: admin@nypdbapa.org" . "\r\n" .
"CC: sajed.dev.bd@gmail.com";

mail($to,$subject,$txt,$headers);

echo "done";


?>