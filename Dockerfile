FROM bookwork-slim

# Add required tools
RUN <<EOF
apt-get update
apt-get install -y curl git
EOF

# Clone ai-hedge-fund
RUN <<EOF
git clone https://github.com/virattt/ai-hedge-fund.git
cd ai-hedge-fund
EOF

# Install Poetry & dependencies
RUN <<EOF
curl -sSL https://install.python-poetry.org | python3 -
poetry install
EOF

COPY ["./run-ai.sh", "./run-ai.sh"]

CMD ["./run-ai.sh"]