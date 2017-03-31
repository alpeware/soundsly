FROM gentoo/stage3-amd64

ENV FFMPEG_VERSION "3.2.4"
ENV PYTUBE_VERSION "0.3.3"

RUN mkdir /usr/portage
ADD make.conf /etc/portage/

# RUN rm /usr/lib64/misc/ssh-keysign
RUN emerge-webrsync
# RUN eselect profile set 1
# RUN emerge -uDU --with-bdeps=y @world

ADD accept /etc/portage/package.accept_keywords/
ADD use /etc/portage/package.use/

#RUN emerge media-libs/fontconfig
RUN emerge media-video/ffmpeg 

# Install pytube
RUN emerge dev-python/pip
RUN pip install pytube

# Remove files
#RUN rm -rf /usr/portage
