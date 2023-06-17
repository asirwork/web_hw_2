FROM python:3.11

WORKDIR .

COPY . .
# Встановимо залежності всередині контейнера
RUN pip install poetry
RUN pip install pyowm
RUN poetry config virtualenvs.create false && poetry install --only main

# Позначимо порт, де працює застосунок всередині контейнера
EXPOSE 5000

# Запустимо наш застосунок всередині контейнера
CMD ["python", "./personal_assistant/main.py"]