FROM oven/bun
WORKDIR /app
RUN mkdir -p storage
COPY . .
COPY storage storage
RUN bun install
CMD ["bun", "run", "index.ts"]