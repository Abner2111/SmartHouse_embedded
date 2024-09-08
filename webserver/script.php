<?php

    if($_POST['action'] == 'control_light')
    {   
        $command = "gpio_handler write";
        $gpio_pin = "";
        $value = $_POST['value'];
        $space = " ";
        
        if($_POST['light'] == 1){
            $gpio_pin = "17";
        } elseif ($_POST['light'] == 2){
            $gpio_pin = "27";
        } elseif ($_POST['light'] == 3){
            $gpio_pin = "22";
        } elseif ($_POST['light'] == 4){
            $gpio_pin = "23";
        } elseif ($_POST['light'] == 5){
            $gpio_pin = "24";
        } 
        
        system($command . $space . $gpio_pin . $space . $value);
        
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
        echo($output);
    }
    
    
    
    
?>
