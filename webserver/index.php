<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GPIO Control</title>
</head>
<body>
    <h1>GPIO Light Control</h1>

    <!-- Form to control light -->
    <form method="POST" action="script.php">
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

        <input type="hidden" name="action" value="control_light">
        <button type="submit">Control Light</button>
    </form>

    <!-- Form to check light status -->
    <form method="POST" action="script.php">
        <h3>Check Light Status</h3>
        <label for="light_check">Select Light:</label>
        <select name="light" id="light_check">
            <option value="1">Light 1</option>
            <option value="2">Light 2</option>
            <option value="3">Light 3</option>
            <option value="4">Light 4</option>
            <option value="5">Light 5</option>
        </select><br><br>

        <input type="hidden" name="action" value="check_light">
        <button type="submit">Check Status</button>
    </form>

    <!-- PHP handling response -->
    <div>
        <h3>Response:</h3>
        <pre>
        <?php
            if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                include 'script.php';
            }
        ?>
        </pre>
    </div>
</body>
</html>
