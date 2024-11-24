# Usa un'immagine di base di Ubuntu 22.04
FROM ubuntu:22.04

# Imposta variabili di ambiente per evitare interazioni durante l'installazione
ENV DEBIAN_FRONTEND=noninteractive

# Aggiorna i pacchetti di sistema e installa le dipendenze
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    ffmpeg \
    python3-pip \
    python3-tk \
    git \
    libglu1-mesa \
    libx11-dev \
    libfontconfig1 \
    libxrender1 \
    libfreetype6 && \
    rm -rf /var/lib/apt/lists/*

# Clona il repository dal GitHub
RUN git clone https://github.com/Anjok07/ultimatevocalremovergui.git /app

# Imposta la cartella di lavoro come quella del repository appena clonato
WORKDIR /app

#https://github.com/Anjok07/ultimatevocalremovergui/issues/1435
RUN sed -i '/Dora==0.0.3/d' requirements.txt

# Installa le dipendenze Python
RUN pip3 install -r requirements.txt

# Comando per eseguire lo script Python
CMD ["python3", "UVR.py"]

