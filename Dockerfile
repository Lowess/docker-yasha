FROM python:3.9 as builder

# Install Yasha templating utility in virtualenv
ENV PYTHONUSERBASE /venv
RUN mkdir /venv \
    && pip install --ignore-installed --user yasha==5.0

FROM python:3.9

ENV PATH=$PATH:/venv/bin
ENV PYTHONPATH=/venv/lib/python3.9/site-packages
COPY --from=builder /venv /venv

ENTRYPOINT ["yasha"]
CMD ["-h"]
