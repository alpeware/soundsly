FROM gentoo/stage3-amd64

ENV FFMPEG_VERSION "3.2.4"
ENV PYTUBE_VERSION "0.3.3"

ADD make.conf /etc/portage/
# RUN rm /usr/lib64/misc/ssh-keysign
RUN mkdir /usr/portage
RUN emerge-webrsync
# RUN eselect profile set 1
# RUN emerge -uDU --with-bdeps=y @world

ADD accept /etc/portage/package.accept_keywords/
RUN emerge media-video/ffmpeg 

# Install pytube
RUN pip install pytube

# Remove files
RUN rm -rf /usr/portage/distfiles/
RUN rm -rf /usr/portage/packages/
