FROM busybox:1.37.0
ADD --checksum=sha256:d6a3c6230b95be07cc88752720fd49816501bb9c3404d50c64becde50cea49bc --chmod=555 https://raw.githubusercontent.com/urvanov-ru/docker-and-kubernetes-2027/refs/heads/master/02.03.12-ADD/checksum/script.sh /script.sh
ENTRYPOINT [ "sh","/script.sh" ]
