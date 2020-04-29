FROM python:3.7 as builder

# Install Yasha templating utility in virtualenv
ENV PYTHONUSERBASE /venv
RUN mkdir /venv \
    && pip install --ignore-installed --user yasha==4.3

FROM python:3.7

ENV PATH=$PATH:/venv/bin
ENV PYTHONPATH=/venv/lib/python3.7/site-packages
COPY --from=builder /venv /venv

ENTRYPOINT ["yasha"]
CMD ["-h"]
