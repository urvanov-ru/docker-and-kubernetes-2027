<!DOCTYPE html>
<html>
  <head>
    <meta charset = "utf-8">
    <title>Простая страница на PHP</title>
  </head>
  <body>
    <p>Привет, <?php echo htmlspecialchars($_POST['user_name']); ?></p>
    <form method="post">
      <label for="user_name">Введите ваше имя:</label>
      <input type="text" id="user_name" name="user_name" required>
      <input type="submit" value="Отправить">
    </form>
    <?php echo this_function_does_not_exist(); ?>
  </body>
</html>