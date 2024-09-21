# Base image
FROM ubuntu:24.04

# Set timezone
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install necessary packages
RUN apt-get update &&\
    apt-get install -y curl git zsh xsel ca-certificates && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

# Set working directory and Python path
WORKDIR /workspace
ENV PYTHONPATH="${PYTHONPATH}:/workspace"

# Change default shell to zsh
RUN chsh -s /bin/zsh root

# Set zsh and create symbolic link to zsh configuration
RUN ln -s /workspace/.config/.zshrc /root/.zshrc

# Install uv using Docker multi-stage build
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv

# Copy project files and install dependencies
COPY ./.python-version ./pyproject.toml ./README.md ./uv.lock ./

# sync project files with uv
RUN uv sync --frozen --compile-bytecode

# Use the virtual environment automatically
ENV VIRTUAL_ENV=/workspace/.venv
ENV PATH="/workspace/.venv/bin:$PATH"

CMD ["/bin/zsh"]
