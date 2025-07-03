FROM python:3.13.4-alpine3.22
# Define o diretório de trabalho dentro do contêiner
WORKDIR /app
# Copia o arquivo de dependências para o diretório de trabalho
COPY requirements.txt .
# Instala as dependências
RUN pip install --no-cache-dir -r requirements.txt
# Copia o restante do código da aplicação para o diretório de trabalho
COPY . .
# Expõe a porta 8000 para que a aplicação possa ser acessada
EXPOSE 8000
# Comando para iniciar a aplicação quando o contêiner for executado
# O host 0.0.0.0 é necessário para que a aplicação seja acessível de fora do contêiner
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]