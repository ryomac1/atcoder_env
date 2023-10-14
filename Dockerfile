# Use the official Python image from the Docker Hub
FROM python:3.9.16

ENV PYTHONPATH "${PYTHONPATH}:/workspace"
WORKDIR /workspace

# Install Zsh, Node.js, and C++ environment
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    zsh curl build-essential gcc g++ && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

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

# Copy AC Library
COPY ac-library /workspace/ac-library
ENV CPLUS_INCLUDE_PATH /workspace/ac-library

COPY .zshrc /root/
CMD ["/bin/zsh"]
