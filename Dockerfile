# Python image
FROM python:3.11.4

# Set timezone
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Set Python path and working directory
ENV PYTHONPATH "${PYTHONPATH}:/workspace"
WORKDIR /workspace

# Install Zsh, C++ environment, Node.js, and AtCoder-cli
RUN apt-get update && \
    apt-get install -y --no-install-recommends zsh curl build-essential gcc g++ && \
    curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g atcoder-cli && \
    acc config default-task-choice all && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# Copy AtCoder-cli configuration
COPY config/atcoder-cli/config.json /root/.config/atcoder-cli-nodejs/
COPY config/atcoder-cli/template /root/.config/atcoder-cli-nodejs/template

# Install AC Library C++

# Install AC Library Python
RUN pip install git+https://github.com/not522/ac-library-python

# Install Poetry
ENV POETRY_HOME=/opt/poetry
RUN curl -sSL https://install.python-poetry.org/ | python - && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false


# Copy Python project files and install dependencies
COPY pyproject.toml poetry.lock ./
RUN poetry install

# Copy AC Library and set environment variable
COPY src/ac-library /workspace/src/ac-library
ENV CPLUS_INCLUDE_PATH /workspace/src/ac-library

# Create non-root user
ENV USERNAME=atcoder
RUN adduser --disabled-password --gecos '' $USERNAME
USER $USERNAME


# Set zsh and copy zsh configuration
COPY config/zsh/.zshrc /home/$USERNAME/.zshrc
CMD ["/bin/zsh"]
