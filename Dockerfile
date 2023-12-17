FROM python:3.11.1
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV PYTHONPATH "${PYTHONPATH}:/workspace"
WORKDIR /workspace

# Install Zsh C++ environment
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    zsh curl build-essential gcc g++ && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

# Install AtCoder-cli
RUN npm install -g atcoder-cli
RUN acc config default-task-choice all
COPY atcoder-cli-config/config.json /root/.config/atcoder-cli-nodejs/
COPY atcoder-cli-config/template /root/.config/atcoder-cli-nodejs/template

# AC Library Pythonのインストール
RUN pip install git+https://github.com/not522/ac-library-python

# Install poetry
ENV POETRY_HOME=/opt/poetry
RUN curl -sSL https://install.python-poetry.org/ | python - && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false

COPY pyproject.toml .
COPY poetry.lock .
RUN poetry install

# Copy AC Library
COPY ac-library /workspace/ac-library
ENV CPLUS_INCLUDE_PATH /workspace/ac-library

COPY .zshrc /root/
CMD ["/bin/zsh"]
