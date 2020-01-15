# imagem base do SO utilizado para criar o contâiner.
FROM alpine:latest

# informações do responsável pela manutenção da image.
MAINTAINER Pedro <pehhagah.1607@gmail.com>

# realiza a cópia dos arquivos de configurações para substituição dos arquivos default.


# atualização e upgrade dos repositórios.
RUN apk update -y
RUN apk upgrade -y

# execução de comandos do Alpine no build da imagem.

# exposição das portas para http e https.
EXPOSE 80
EXPOSE 443
