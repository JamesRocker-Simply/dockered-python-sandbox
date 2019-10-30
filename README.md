# dockered-python
Python in docker on SB hardened CentOS image for testing and experimenting

## Instructions:
- log into `bnw`
- to build, run `build.sh`
- to execute image interactively, run `run_it.sh`

Put all your Python module dependencies in `requirements.txt` file.<br><br>
Directory `source` is mounted in the docker image as `/sbapp/source`. All changes in `source` directory will be immediately reflected inside docker container.<br><br>
To clean unused docker data (sometimes docker complains about lack of disk space during image build), run `docker_prune.sh`.

<br>

![dockered-python](https://miro.medium.com/max/1008/1*iBGlEPUruUqqT5NreeEF8g.png)