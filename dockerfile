# Usa imagem Python 3.11 leve
FROM python:3.11-slim

# Cria diretório de trabalho
WORKDIR /app

# Copia requirements e instala dependências
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código
COPY . .

# Expõe a porta padrão do Streamlit
EXPOSE 8501

# Evita problemas de buffer no log
ENV PYTHONUNBUFFERED=1

# Comando padrão ao rodar o container
CMD ["streamlit", "run", "new_frontend.py", "--server.port=8501", "--server.address=0.0.0.0"]
