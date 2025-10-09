FROM oven/bun AS builder
WORKDIR /app
COPY . .
RUN bun install --frozen-lockfile
RUN bun run build
FROM busybox:latest
RUN adduser -D static
USER static
WORKDIR /home/static
COPY --from=builder /app/doc_build .
CMD ["busybox", "httpd", "-f", "-v", "-p", "3000"]
