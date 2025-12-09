FROM busybox:1.37.0
ENV MESSAGE_LINE1="Hello, my love\n"
ENV MESSAGE_LINE2=How\ are\ you\\n
ENTRYPOINT ["sh", "-c", "echo -e $MESSAGE_LINE1$MESSAGE_LINE2"]
