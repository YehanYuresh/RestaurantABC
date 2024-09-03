

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add User</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <h2>Register new Customer</h2>
    <form action="user?action=add" method="post">
        <input type="hidden" name="action" value="add"/>
        <label for="username">User name:</label>
        <input type="text" id="username" name="username" required><br><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>      
        
        <input type="hidden" id="usertype" name="usertype" value ='Customer' ><br><br>
        
        <input type="submit" value="Register">
    </form>
</body>
</html>