<?php

if ($_POST['action'] == 'control_light') {   
    $command = "gpio_handler write";
    $gpio_pin = "";
    $value = $_POST['value'];
    $space = " ";

    if ($_POST['light'] == 1) {
        $gpio_pin = "17";
    } elseif ($_POST['light'] == 2) {
        $gpio_pin = "27";
    } elseif ($_POST['light'] == 3) {
        $gpio_pin = "22";
    } elseif ($_POST['light'] == 4) {
        $gpio_pin = "23";
    } elseif ($_POST['light'] == 5) {
        $gpio_pin = "24";
    } 
    
    system($command . $space . $gpio_pin . $space . $value);
    $light_status = " ";
    if($value == '1'){
        $light_status = "ON";
    } else {
        $light_status = "OFF";
    }
    echo json_encode(["message" => "Light $value set to $light_status"]);
}

    if($_POST['action'] == 'check_light'){
        $command = "gpio_handler read";
        $gpio_pin = "";
        $space = " ";
        if($_POST['light'] == 1){
            $gpio_pin = "21";
        } elseif ($_POST['light'] == 2){
            $gpio_pin = "20";
        } elseif ($_POST['light'] == 3){
            $gpio_pin = "16";
        } elseif ($_POST['light'] == 4){
            $gpio_pin = "12";
        } elseif ($_POST['light'] == 5){
            $gpio_pin = "7";
        } 
        $output = shell_exec($command . $space . $gpio_pin);
        echo json_encode([
            "light" => $_POST['light'], 
            "status" => trim($output)
        ]);
    }
    if ($_POST['action'] == 'check_camera') {
        $image_file = '/tmp/captured_image.jpeg'; 
        $command = "fswebcam -r 640x480 --jpeg -D 1 $image_file"; 
    
        system($command);
  
        if (file_exists($image_file)) {
            header('Content-Type: image/jpeg');
            header('Content-Length: ' . filesize($image_file));
            readfile($image_file);
            unlink($image_file); 
        } else {
            echo "Error capturing image.";
        }
    }
    
    
    
    
?>
