# Stage 1: Build binary using Go 1.18
FROM golang:1.18-alpine AS builder
WORKDIR /app
# Copy dependencies first for better caching
COPY go.mod go.sum ./
RUN go mod download
# Copy source and build
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o backend .

# Stage 2: Final lightweight image
FROM alpine:latest
WORKDIR /root/
# Copy the binary from the builder stage
COPY --from=builder /app/backend .
RUN chmod +x ./backend
EXPOSE 8000
CMD ["./backend"]

