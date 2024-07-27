# Base image
FROM ubuntu:24.04

# Set timezone
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install necessary packages
RUN apt-get update &&\
    apt-get install -y curl git zsh xsel&& \
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

# Install Rye
ENV RYE_HOME="/opt/rye"
ENV PATH="$RYE_HOME/shims:$PATH"
RUN curl -sSf https://rye.astral.sh/get | RYE_VERSION="0.34.0" RYE_INSTALL_OPTION="--yes" bash && \
    rye config --set-bool behavior.use-uv=true

# Copy project files and install dependencies
COPY ./.python-version ./pyproject.toml ./requirements* ./README.md ./

# sync project files
RUN rye sync

CMD ["/bin/zsh"]
