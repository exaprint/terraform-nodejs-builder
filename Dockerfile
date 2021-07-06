FROM cimg/node:12.22.1
LABEL maintainer=fulfillmentsquad@exagroup.biz

RUN echo "Update repo list" \
    && sudo apt-get update \
    && sudo apt-get install nginx \
    && sudo service nginx start

RUN echo "Install brew" \
    && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

RUN echo "Install tfenv" \
    && cd /home/linuxbrew/.linuxbrew/bin/ \
    && ./brew install tfenv

RUN echo "Install tfenv and terraform" \
    && cd /home/linuxbrew/.linuxbrew/bin/ \
    && ./brew info tfenv \
    && cd /home/linuxbrew/.linuxbrew/Cellar/tfenv/2.2.2/bin \
    && ./tfenv install 0.11.15 \
    && ./tfenv use 0.11.15

ENV PATH="/home/linuxbrew/.linuxbrew/Cellar/tfenv/2.2.2/versions/0.11.15:${PATH}"
ENV HOME=/root

RUN terraform -v


ENTRYPOINT ["/bin/sh"]

