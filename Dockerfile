FROM jekyll/builder as builder

ENV BUILD_DIR=/src/_site

WORKDIR /src
COPY drinks .
RUN mkdir $BUILD_DIR && jekyll build --destination $BUILD_DIR


FROM nginx:1.13-alpine

COPY --from=builder /src/_site /usr/share/nginx/html/
