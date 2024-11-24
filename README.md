# [Ultimate Vocal Remover Gui](https://github.com/Anjok07/ultimatevocalremovergui) Docker Image (GPU Accelerated)

This Docker image provides a convenient environment for running Ultimate Vocal Remover.
It is based on Ubuntu image and includes the necessary dependencies.

## Prerequisites
- Before you can use this Docker image, you need to have Docker installed on your system.

### Installing Docker

Follow the instructions on the [official Docker website](https://docs.docker.com/get-docker/) to install Docker for your operating system.

### NVIDIA Container Toolkit

Install [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)

## Usage
To build the Docker image, use the following command:

```bash
docker build -t manzolo/uvr-docker .
```

## Running UVR Gui
To run UVR Gui with the Docker image, you can use the following example command:

```bash
xhost +local:docker
docker run --gpus all -it -v ${PWD}/audio-files:/app/output -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY manzolo/uvr-docker
```
This command does the following:

- Utilizes GPU acceleration (--gpus all).
- Mounts the local directory audio-files to /app/output inside the container (this is where your output will be saved).
- Shares the X11 display for GUI usage with -e DISPLAY=$DISPLAY
    
If you do not have a GPU or want to run without GPU acceleration, you can omit the --gpus all flag from the command. For example:
```bash
xhost +local:docker
docker run -it -v ${PWD}/audio-files:/app/output -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY manzolo/uvr-docker
```

## Interacting with UVR Gui

Once the container starts, UVR Gui will launch. Follow these steps to process your audio:

### Choose Model:
  In the UVR Gui, "Choose MDX-NET model" click on "Choose model" and "Download more models"
  From the list of models, select the "mdx-net model: UVR-MDX-NET inst HQ 4" as the example model.
  Press the Download button to download the selected model.
  Once the model is downloaded, select it to load it into the GUI for processing.

### Select Input File:
Inside the /app/output folder (which is mapped to your local machine's ${PWD}/audio-files directory), choose an audio file to process. This will be the input audio file.

### Select Output Directory:
Next, in the UVR Gui, select /app/output as the Output Directory. This is where the processed files will be saved.

### Start Processing:
After selecting the model and input/output directories, you can start the audio separation process by clicking the "Start processing" button.
    
### Access Processed Files:
Once the process is complete, you will find the separated audio files in your local output folder, which is mapped from the /app/output directory inside the container.

## References
- [Ultimate Vocal Remover GUI GitHub Repository](https://github.com/Anjok07/ultimatevocalremovergui)

- [NVIDIA Container Toolkit Installation Guide](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)

- [Docker Official Website](https://docs.docker.com/get-docker/)

Feel free to explore and adapt this Docker image based on your use case and requirements. For more details on Ultimate Vocal Remover and its usage, refer to the official documentation.
