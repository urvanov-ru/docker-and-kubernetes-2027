FROM busybox:1.37.0
ENV SUBDIR=DIR_B
WORKDIR DIR_A
WORKDIR $SUBDIR
RUN touch $( date '+%Y-%m-%d_%H-%M-%S' )
RUN ls
