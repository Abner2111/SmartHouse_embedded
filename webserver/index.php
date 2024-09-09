<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GPIO and Camera Control</title>
    <script>
        // Function to control the light and display the response
        function controlLight() {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "script.php", true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onload = function () {
                if (xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText);
                    document.getElementById('control_message').textContent = response.message;
                } else {
                    document.getElementById('control_message').textContent = "Error controlling the light.";
                }
            };

            var light = document.getElementById('light').value;
            var value = document.getElementById('value').value;
            var params = 'action=control_light&light=' + light + '&value=' + value;
            xhr.send(params);
        }

        // Function to check light status and display it using GET
        function checkLightStatus() {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "script.php?action=check_light&light=" + document.getElementById('light_check').value, true);
            xhr.onload = function () {
                if (xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText);
                    document.getElementById('light_status').textContent = 
                        "Light " + response.light + " status: " + response.status;
                } else {
                    document.getElementById('light_status').textContent = "Error checking light status.";
                }
            };
            xhr.send();
        }

        // Function to check door status and display it using GET
        function checkDoorStatus() {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "script.php?action=check_door&door=" + document.getElementById('door_check').value, true);
            xhr.onload = function () {
                if (xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText);
                    document.getElementById('door_status').textContent = 
                        "Door " + response.door + " status: " + response.status;
                } else {
                    document.getElementById('door_status').textContent = "Error checking door status.";
                }
            };
            xhr.send();
        }

        // Function to capture the image and display it using GET
        function captureImage() {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "script.php?action=check_camera", true);
            xhr.responseType = "blob"; // Expect binary data (image)
            xhr.onload = function () {
                if (xhr.status === 200) {
                    var img = document.createElement("img");
                    img.src = window.URL.createObjectURL(xhr.response);
                    document.getElementById('camera_result').innerHTML = '';
                    document.getElementById('camera_result').appendChild(img);
                } else {
                    document.getElementById('camera_result').innerHTML = 'Error capturing image.';
                }
            };
            xhr.send();
        }
    </script>
</head>
<body>
    <h1>GPIO and Camera Control</h1>

    <!-- Form to control light using POST -->
    <h3>Control Light</h3>
    <label for="light">Select Light:</label>
    <select name="light" id="light">
        <option value="1">Light 1</option>
        <option value="2">Light 2</option>
        <option value="3">Light 3</option>
        <option value="4">Light 4</option>
        <option value="5">Light 5</option>
    </select><br><br>

    <label for="value">Set Value (0 or 1):</label>
    <input type="number" name="value" id="value" min="0" max="1"><br><br>

    <button type="button" onclick="controlLight()">Control Light</button>

    <!-- Area to display control response -->
    <p id="control_message"></p>

    <!-- Form to check light status using GET -->
    <h3>Check Light Status</h3>
    <label for="light_check">Select Light:</label>
    <select name="light_check" id="light_check">
        <option value="1">Light 1</option>
        <option value="2">Light 2</option>
        <option value="3">Light 3</option>
        <option value="4">Light 4</option>
        <option value="5">Light 5</option>
    </select><br><br>

    <button type="button" onclick="checkLightStatus()">Check Status</button>

    <!-- Area to display light status -->
    <p id="light_status"></p>

    <!-- Form to check door status using GET -->
    <h3>Check Door Status</h3>
    <label for="door_check">Select Door:</label>
    <select name="door_check" id="door_check">
        <option value="1">Door 1</option>
        <option value="2">Door 2</option>
        <option value="3">Door 3</option>
        <option value="4">Door 4</option>
    </select><br><br>

    <button type="button" onclick="checkDoorStatus()">Check Door Status</button>

    <!-- Area to display door status -->
    <p id="door_status"></p>

    <!-- Button to capture image using GET -->
    <h3>Capture Image</h3>
    <button onclick="captureImage()">Capture Image</button>

    <!-- Area to display captured image -->
    <div id="camera_result"></div>
</body>
</html>
