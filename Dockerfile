FROM alpine:latest

RUN mkdir -p ~/.config/nvim

RUN apk add neovim git

COPY . /root/.config/nvim/

CMD [ "nvim" ]
