FROM debian:12-slim AS build
RUN apt-get update && \
    apt-get install --no-install-suggests --no-install-recommends --yes python3-venv gcc libpython3-dev && \
    python3 -m venv /venv && \
    /venv/bin/pip install --upgrade pip setuptools wheel


FROM build AS build-env
COPY requirements.txt ./
RUN /venv/bin/pip install --disable-pip-version-check -r requirements.txt --target /packages

FROM gcr.io/distroless/python3-debian12
USER 1001:1001
WORKDIR /app
COPY --from=build-env /packages /packages
COPY /src /app

ENV PYTHONPATH=/packages
EXPOSE 10000
CMD ["standalone.py"]