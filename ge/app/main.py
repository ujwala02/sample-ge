from typing import Union

from fastapi import FastAPI

app = FastAPI()


@app.get("/ge")
def read_root():
    return "Hello GE"