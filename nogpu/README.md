## NOGPU

Useful is you have no local gpu.

Builds a docker image (AGENT.VERSION.nogpu) that uses tensorflow-cpu and can be run locally. Also builds a normal gpu image (AGENT.VERSION) for pushing up to the contest site.  

### Usage
Add the NOGPU clause below to your agents docker file.
```
#START NOGPU 
ARG NOGPU
RUN if [ ${NOGPU} ]; then \
    . ~/venv/bin/activate && \
    pip uninstall -y tensorflow-gpu && pip install tensorflow; \
    fi
#END NOGPU
```
$DOCKER_REGISTRY must be defined and you must be logged in as per https://contest.openai.com/details

### Example

Assumes rainbow_agent.py and sonic_util.py from https://github.com/openai/retro-baselines/tree/master/agents are on path.
```
./build_nogpu.sh rainbow v5
retro-contest run --agent $DOCKER_REGISTRY/rainbow:v5.nogpu --results-dir results --use-host-data -N SonicTheHedgehog-Genesis GreenHillZone.Act1
docker push $DOCKER_REGISTRY/rainbow:v5
```

