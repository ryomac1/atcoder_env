FROM python:3.9.16

ENV PYTHONPATH "${PYTHONPATH}:/workspace"
WORKDIR /workspace

# Install Zsh and Node.js
RUN apt-get update && apt-get install -y zsh curl
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

# Install poetry
ENV POETRY_HOME=/opt/poetry
RUN curl -sSL https://install.python-poetry.org/ | python - && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false
COPY pyproject.toml .
RUN poetry install

# Install AtCoder-cli
RUN npm install -g atcoder-cli
RUN acc config default-task-choice all
COPY atcoder-cli-config/config.json /root/.config/atcoder-cli-nodejs/
COPY atcoder-cli-config/template /root/.config/atcoder-cli-nodejs/template

COPY .zshrc /root/
CMD ["/bin/zsh"]
