ARG REGION=eu-west-1
ARG ENVIRONMENT=dev
ARG ACCOUNT_ID=129462528407

FROM ${ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/sb-ruby-centos-24x-master-0605542-0-${ENVIRONMENT}-base-${REGION}:latest

# Add local user bin folder to PATH
ENV PATH=$PATH:/home/sbapp/.local/bin

# Set up home directory
ENV APP_HOME /sbapp
WORKDIR $APP_HOME

# Install python3
RUN yum -y install python36 python36-pip python36-devel python36-libs

# Instal other CentOS packages
RUN yum -y install redhat-rpm-config gcc libffi-devel openssl-devel git
RUN yum clean all

# update pip
RUN pip3 install -U pip

# Switch to local user
USER sbapp
# Install Python packages
COPY --chown=sbapp requirements.txt $APP_HOME/
RUN pip3 install --user -r /sbapp/requirements.txt


EXPOSE 8888

CMD ["ls"]