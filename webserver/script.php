<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

if($_SERVER['REQUEST_METHOD'] =='OPTIONS'){
        http_response_code(200);
        exit(0);
}
// Handle JSON input for POST requests
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $inputJSON = file_get_contents('php://input');
    $input = json_decode($inputJSON, true); // Decode JSON into an associative array

    if ($input['action'] == 'control_light') {
        $command = "gpio_handler write";
        $gpio_pin = "";
        $value = $input['value'];
        $light = $input['light'];
        $space = " ";

        // Determine the correct GPIO pin for the selected light
        if ($light == 1) {
            $gpio_pin = "17";
        } elseif ($light == 2) {
            $gpio_pin = "27";
        } elseif ($light == 3) {
            $gpio_pin = "22";
        } elseif ($light == 4) {
            $gpio_pin = "23";
        } elseif ($light == 5) {
            $gpio_pin = "24";
        }

        system($command . $space . $gpio_pin . $space . $value);

        $light_status = ($value == '1') ? "ON" : "OFF";
        echo json_encode(["message" => "Light $light set to $light_status"]);
    }
}

// Handle GET requests
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    if ($_GET['action'] == 'check_light') {
        $command = "gpio_handler read";
        $gpio_pin = "";

        // Determine the correct GPIO pin for the selected light
        if ($_GET['light'] == 1) {
            $gpio_pin = "21";
        } elseif ($_GET['light'] == 2) {
            $gpio_pin = "20";
        } elseif ($_GET['light'] == 3) {
            $gpio_pin = "16";
        } elseif ($_GET['light'] == 4) {
            $gpio_pin = "12";
        } elseif ($_GET['light'] == 5) {
            $gpio_pin = "7";
        }

        $output = shell_exec($command . ' ' . $gpio_pin);
        echo json_encode([
            "light" => $_GET['light'],
            "status" => trim($output)
        ]);
    }

    if ($_GET['action'] == 'check_door') {
        $command = "gpio_handler read";
        $gpio_pin = "";

        // Determine the correct GPIO pin for the selected door
        if ($_GET['door'] == 1) {
            $gpio_pin = "5";
        } elseif ($_GET['door'] == 2) {
            $gpio_pin = "6";
        } elseif ($_GET['door'] == 3) {
            $gpio_pin = "13";
        } elseif ($_GET['door'] == 4) {
            $gpio_pin = "19";
        }

        $output = shell_exec($command . ' ' . $gpio_pin);
        echo json_encode([
            "door" => $_GET['door'],
            "status" => trim($output)
        ]);
    }

    if ($_GET['action'] == 'check_camera') {
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
}
?>
