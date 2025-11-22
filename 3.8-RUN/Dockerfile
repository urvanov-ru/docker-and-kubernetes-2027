FROM busybox:1.37.0
RUN ["echo", "Hello, world"]
RUN ["ls"]

RUN echo "PWD from shell form =" $PWD
RUN echo "PATH from shell form =" $PATH

RUN [ "echo", "$PATH" ]
RUN [ "echo", "$PWD" ]

RUN [ "sh", "-c", "echo \"PATH from exec form =\" $PATH" ]
RUN [ "sh", "-c", "echo \"PWD from exec form =\" $PWD" ]