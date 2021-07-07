FROM cimg/node:12.22.1
LABEL maintainer=fulfillmentsquad@exagroup.biz

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

RUN echo "install awscli" \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && sudo ./aws/install -i /usr/local/aws-cli -b /usr/local/bin \
    && aws --version

ENV PATH="/home/linuxbrew/.linuxbrew/Cellar/tfenv/2.2.2/versions/0.11.15:${PATH}"
ENV HOME=/home/circleci


ENTRYPOINT ["/bin/bash"]

