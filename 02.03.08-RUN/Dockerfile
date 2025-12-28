FROM busybox:1.37.0
RUN echo Hello, world
RUN ["echo", "Hello, world"]
RUN ["ls"]

# Подстановка значений переменных окружения сработает.
# Выведутся значения.
RUN echo "PWD from shell form =" $PWD
RUN echo "PATH from shell form =" $PATH

# Подстановка значений переменных окружения НЕ сработает.
# Выведутся просто строки "$PATH", "$PWD"
RUN [ "echo", "$PATH" ]
RUN [ "echo", "$PWD" ]

# Пример вывода значений переменных окружения 
# в exec form
RUN [ "sh", "-c", "echo \"PATH from exec form =\" $PATH" ]
RUN [ "sh", "-c", "echo \"PWD from exec form =\" $PWD" ]