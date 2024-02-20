FROM alpine:latest

RUN mkdir -p ~/.config/nvim

RUN apk add neovim

COPY . /root/.config/nvim/

CMD [ "nvim" ]
